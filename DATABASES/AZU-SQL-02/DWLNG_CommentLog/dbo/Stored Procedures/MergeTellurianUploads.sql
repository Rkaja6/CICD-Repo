











/*
	Title: MergeTellurianUploads
	Date: 2019-04-14
	Author:  Aaron Vogt 832-429-7719
*/
CREATE PROCEDURE
	[dbo].[MergeTellurianUploads]
AS
BEGIN
	IF OBJECT_ID('tempdb..#unprocessedTellurianUploads') IS NOT NULL DROP TABLE #unprocessedTellurianUploads
	
	SELECT 
	  [SessionID],
	  [UploadDate],
      [UserId],
      [UserCompanyName],
      [CommentID],
	  [DocumentNumber],
      [ResponseToDisposition],
      [Status],	
	  [CommentClosedDate]
	INTO
		#unprocessedTellurianUploads
	FROM 
		[dbo].[GetUnprocessedTellurianRows]
 
	MERGE
		dbo.Response AS Destination
	USING
	(
		SELECT DISTINCT
			UserID,
			CommentID,
			DocumentNumber,
			ResponseToDisposition,
			Status,
			CommentClosedDate
		FROM
			#unprocessedTellurianUploads
	) AS Source
	ON
		Destination.DocumentNumber = Source.DocumentNumber AND
		Destination.CommentID = Source.CommentID
	WHEN MATCHED AND Destination.LockRecord = 'N'
		THEN UPDATE
			SET
				Destination.UserID = Source.UserID,
				Destination.ResponseToDisposition = Source.ResponseToDisposition,
				Destination.Status = Source.Status,
				Destination.CommentClosedDate = Source.CommentClosedDate,
				Destination.UpdatedDate = GETDATE()
	WHEN NOT MATCHED THEN INSERT
		(
			UserID,
			CommentID,
			DocumentNumber,
			ResponseToDisposition,
			Status,
			CommentClosedDate,
			CreatedDate,
			UpdatedDate,
			LockRecord
		)
	VALUES
		(
			Source.UserID,
			Source.CommentID,
			Source.DocumentNumber,
			Source.ResponseToDisposition,
			Source.Status,
			Source.CommentClosedDate,
			GETDATE(),
			GETDATE(),
			'N'
		);

-- lock rows were status = "Closed"
	UPDATE R
	SET 
		LockRecord = 'Y'
	FROM 
		dbo.Response R
	INNER JOIN 
		#unprocessedTellurianUploads currud
	ON	
		R.DocumentNumber = currud.DocumentNumber AND
		R.CommentID = currud.CommentID
	WHERE 
		currud.Status = 'CLOSED';

	UPDATE C
	SET 
		LockRecord = 'Y'
	FROM 
		dbo.Comment C
	INNER JOIN 
		#unprocessedTellurianUploads currud
	ON	
		C.DocumentNumber = currud.DocumentNumber AND
		C.CommentID = currud.CommentID
	WHERE 
		currud.Status = 'CLOSED';

-- set rows to Processed
	UPDATE ud
	SET
		RowProcessed = 'Y'
	FROM
		[dbo].[UploadData] ud
	INNER JOIN
		#unprocessedTellurianUploads currud
	ON
		ud.SessionID = currud.SessionID AND
		ud.UploadDate = currud.UploadDate
				
END