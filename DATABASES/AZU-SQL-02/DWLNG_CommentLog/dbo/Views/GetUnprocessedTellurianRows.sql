








CREATE VIEW [dbo].[GetUnprocessedTellurianRows] AS
SELECT ud.[RowNumber]
      ,ud.[WorksheetName]
      ,ud.[IPAddress]
      ,usrses.SessionID
	  ,usrses.UserId
	  ,usrses.UserCompanyName
	  ,usrses.EmailAddress
      ,usrses.[UploadDate]
      ,ud.[RowProcessed]
      ,REPLACE(ud.[Column1],'_x000D_','') AS CommentID
      ,ud.[Column2] AS DocumentSNumber
	  ,REPLACE(ud.[Column3],'_x000D_','') AS DocumentNumber
	  ,ud.[Column4] AS DocumentTitle
	  ,dateadd(mi,CONVERT(numeric(17,5),ud.[Column5])*1440,'1899-12-30') AS CommentReceivedDate
      ,ud.[Column6] AS MRNumber
      ,ud.[Column7] AS BechtelRE
      ,ud.[Column8] AS PageNumber
      ,ud.[Column9] AS CommentBy
	  ,ud.[Column10] AS CommentText
      ,ud.[Column11] AS BechtelDisposition
	  ,dateadd(mi,CONVERT(numeric(17,5),ud.[Column12])*1440,'1899-12-30') AS CommentDispositionDate
	  ,ud.[Column13] AS ResponseToDisposition
      ,ud.[Column14] AS Status
	  ,dateadd(mi,CONVERT(numeric(17,5),ud.[Column15])*1440,'1899-12-30') AS CommentClosedDate
      ,ud.[Column16] AS IssuedInConferenceNumber
  FROM
		[dbo].[UploadData] ud
  INNER JOIN
		[dbo].[UnprocessedRowsSessionIDUploadDate] usrses
  ON
		ud.SessionId = usrses.SessionId AND
		ud.UploadDate = usrses.UploadDate
  WHERE 
		RowProcessed <> 'Y' AND 
		usrses.UserCompanyName = 'Tellurian' AND 
		LTRIM(RTRIM(ud.Column1)) NOT IN ('User Key','Comment ID') AND
		(ud.[Column3] is not null OR ud.[Column3] <> '')