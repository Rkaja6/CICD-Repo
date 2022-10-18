









Create view [dbo].[V_CommentLogAll]
As

SELECT CAST(C.[CommentID] AS nvarchar(20)) as [Comment ID]
      ,C.[DocumentSNumber] as [Doc S No]
      ,CAST(C.[DocumentNumber] AS nvarchar(50)) as [Document Number]
      ,CAST(C.[DocumentTitle] AS nvarchar(255)) as [Document Title]
      ,C.[CommentReceivedDate] as [Date Comments Received]
      ,CAST(C.[MRNumber] AS nvarchar(50)) as [MR Number]
      ,CAST(C.[BechtelRE] AS nvarchar(50)) as [Bechtel RE]
      ,CAST(C.[PageNumber] AS nvarchar(200)) as [Page Number]
      ,CAST(C.[CommentBy] AS nvarchar(50)) as [Comment by]
	  ,REPLACE(CAST(C.[CommentText] AS nvarchar(4000)),'_x000D_',char(13)) as [Comment]
      ,REPLACE(CAST(C.[BechtelDisposition] AS nvarchar(4000)),'_x000D_',char(13)) as [Bechtel Disposition]
      ,C.[CommentDispositionDate] as [Date Comment Dispositioned]
      ,REPLACE(CAST(R.[ResponseToDisposition] AS nvarchar(4000)),'_x000D_',char(13)) as [Client Comments to Bechtel Disposition]
      ,CAST(R.[Status] AS nvarchar(20)) as Status
      ,R.[CommentClosedDate] as [Date Closed]
	  ,CAST(C.[IssuedInConferenceNumber] AS nvarchar(50)) as [Issued in Conference Note Number]
	  ,CAST(ComUsr.Name AS nvarchar(50)) as BechtelLastUpdatedUser
      ,C.[UpdatedDate] as BechtelLastUpdatedDate
      ,C.[CreatedDate] as BechtelCreatedDate
      ,CAST(ResUsr.Name AS nvarchar(50)) AS TellurianLastUpdatedUser
	  ,R.[UpdatedDate] as TellurianLastUpdatedDate
      ,R.[CreatedDate] as TellurianCreatedDate
	  ,CAST(REPLACE(C.[CommentID],'MC-','') as int) AS [Sort Column]
FROM [dbo].[Comment] C
LEFT JOIN [dbo].[Response] R
on C.CommentID = R.CommentID
AND C.DocumentNumber = R.[DocumentNumber]
LEFT JOIN dbo.Users ComUsr
on ComUsr.Id = C.UserId
LEFT JOIN dbo.Users ResUsr
on ResUsr.Id = R.UserId