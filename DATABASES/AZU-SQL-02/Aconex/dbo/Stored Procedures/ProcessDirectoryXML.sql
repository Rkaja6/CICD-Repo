/************************************************************
** Name: ProcessDocumentMetadataXML
** Desc: 
** Auth: Aaron Vogt
** Date: 02/07/2020
**************************
** Change History
**************************
** PR Date         Author         Description 
** -- ----         ------         -------------------------------------------
** 1  02/07/2020   Aaron          Object creation
************************************************************/
CREATE PROCEDURE ProcessDirectoryXML
	@DirectoryXML VARCHAR(MAX)
AS
BEGIN
	DECLARE @DirectoryXMLDocumentHandle INT
	SELECT TOP 1 @DirectoryXML = DirectoryXML FROM DirectoryXML
	EXEC sp_xml_preparedocument @DirectoryXMLDocumentHandle OUTPUT, @DirectoryXML;  
	SELECT *
	INTO dbo.Directory
	FROM OPENXML(@DirectoryXMLDocumentHandle, '/DirectorySearch/SearchResults/Directory')
	WITH
	(
		Mobile VARCHAR(200) './Mobile',
		OrganizationId VARCHAR(200) './OrganizationId',
		OrganizationName VARCHAR(200) './OrganizationName',
		JobTitle VARCHAR(200) './JobTitle',
		ProjectAddress VARCHAR(200) './ProjectAddress',
		ProjectFax VARCHAR(200) './ProjectFax',
		ProjectPhone VARCHAR(200) './ProjectPhone',
		SearchResultType VARCHAR(200) './SearchResultType',
		TradingName VARCHAR(200) './TradingName',
		UserId VARCHAR(200) './UserId',
		UserName VARCHAR(200) './UserName'
	)
END