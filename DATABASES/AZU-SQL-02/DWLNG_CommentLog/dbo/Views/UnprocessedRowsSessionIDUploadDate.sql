




CREATE VIEW [dbo].[UnprocessedRowsSessionIDUploadDate] AS
  SELECT SessionID, UploadDate, u.Id AS UserId, u.CompanyName AS UserCompanyName, u.EmailAddress
  FROM 
	[dbo].[UploadData] ud
  INNER JOIN
	[dbo].[Users] u
 ON	
	LTRIM(RTRIM(ud.Column2)) = LTRIM(RTRIM(u.UserKey))
 WHERE 
	ud.RowProcessed <> 'Y'