create view dbo.dbtune as select * from dbo.SDE_dbtune
GO
GRANT SELECT
    ON OBJECT::[dbo].[dbtune] TO PUBLIC
    AS [dbo];

