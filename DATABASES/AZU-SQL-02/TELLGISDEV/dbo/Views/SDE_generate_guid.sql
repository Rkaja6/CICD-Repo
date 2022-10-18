CREATE VIEW dbo.SDE_generate_guid AS 
 SELECT '{' + CONVERT(NVARCHAR(36),newid()) + '}' as guidstr
GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_generate_guid] TO PUBLIC
    AS [dbo];

