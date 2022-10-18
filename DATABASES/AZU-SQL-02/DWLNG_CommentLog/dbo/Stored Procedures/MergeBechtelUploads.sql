








/*
	Title: MergeBechtelUploads
	Date: 2019-04-14
	Author:  Aaron Vogt 832-429-7719
*/
CREATE PROCEDURE
	[dbo].[MergeBechtelUploads]
AS
BEGIN
	IF OBJECT_ID('tempdb..#unprocessedBechtelUploads') IS NOT NULL DROP TABLE #unprocessedBechtelUploads
	
	SELECT 
	  [SessionID]
	  ,[UploadDate]
      ,[UserId]
      ,[UserCompanyName]
      ,CommentID
      ,DocumentSNumber
      ,DocumentNumber	
      ,DocumentTitle	
      ,CommentReceivedDate
      ,MRNumber
      ,BechtelRE
      ,PageNumber
	  ,CommentBy
      ,CommentText
      ,BechtelDisposition
	  ,CommentDispositionDate
	  ,[IssuedInConferenceNumber]
	INTO
		#unprocessedBechtelUploads
	FROM 
		[dbo].[GetUnprocessedBechtelRows]
  
	MERGE
		dbo.Comment AS Destination
	USING
	(
		SELECT DISTINCT
			UserID,
			CommentID,
			DocumentSNumber,
			DocumentNumber,
			DocumentTitle,
			CommentReceivedDate,
			MRNumber,
			BechtelRE,
			PageNumber,
			CommentBy,
			CommentText,
			BechtelDisposition,
			CommentDispositionDate,
			[IssuedInConferenceNumber]
		FROM
			#unprocessedBechtelUploads
	) AS Source
	ON
		Destination.DocumentNumber = Source.DocumentNumber AND
		Destination.CommentID = Source.CommentID
	WHEN MATCHED AND Destination.LockRecord = 'N'
		THEN UPDATE
			SET
				Destination.DocumentSNumber = Source.DocumentSNumber,
				Destination.DocumentNumber = Source.DocumentNumber,
				Destination.DocumentTitle = Source.DocumentTitle,
				Destination.CommentReceivedDate = Source.CommentReceivedDate,
				Destination.MRNumber = Source.MRNumber,
				Destination.BechtelRE = Source.BechtelRE,
				Destination.PageNumber = Source.PageNumber,
				Destination.CommentBy = Source.CommentBy,
				Destination.CommentText = Source.CommentText,
				Destination.BechtelDisposition = Source.BechtelDisposition,
				Destination.CommentDispositionDate = Source.CommentDispositionDate,
				Destination.[IssuedInConferenceNumber] = Source.[IssuedInConferenceNumber],
				Destination.UserID = Source.UserID,
				Destination.UpdatedDate = GETDATE()
	WHEN NOT MATCHED THEN INSERT
		(
			CommentID,
			DocumentSNumber,
			DocumentNumber,
			DocumentTitle,
			CommentReceivedDate,
			MRNumber,
			BechtelRE,
			Pagenumber,
			CommentBy,
			CommentText,
			BechtelDisposition,
			CommentDispositionDate,
			[IssuedInConferenceNumber],
			UserID,
			CreatedDate,
			UpdatedDate,
			LockRecord
		)
	VALUES
		(
			Source.CommentID,
			Source.DocumentSNumber,
			Source.DocumentNumber,
			Source.DocumentTitle,
			Source.CommentReceivedDate,
			Source.MRNumber,
			Source.BechtelRE,
			Source.PageNumber,
			Source.CommentBy,
			Source.CommentText,
			Source.BechtelDisposition,
			Source.CommentDispositionDate,
			Source.[IssuedInConferenceNumber],
			Source.UserID,
			GETDATE(),
			GETDATE(),
			'N'
		);

	UPDATE ud
	SET
		RowProcessed = 'Y'
	FROM
		[dbo].[UploadData] ud
	INNER JOIN
		#unprocessedBechtelUploads currud
	ON
		ud.SessionID = currud.SessionID AND
		ud.UploadDate = currud.UploadDate

				
END