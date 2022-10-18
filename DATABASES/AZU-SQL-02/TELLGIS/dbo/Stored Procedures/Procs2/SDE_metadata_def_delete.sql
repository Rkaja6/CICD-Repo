CREATE PROCEDURE dbo.SDE_metadata_def_delete @id1        INTEGER, @id2 INTEGER, @id3 INTEGER, @id4 INTEGER, @id5 INTEGER,        @id6 INTEGER, @id7 INTEGER, @id8 INTEGER, @id9 INTEGER, @id10 INTEGER AS       SET NOCOUNT ON DELETE FROM dbo.SDE_metadata WHERE record_id IN (       @id1, @id2, @id3, @id4, @id5, @id6, @id7, @id8, @id9, @id10)
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_metadata_def_delete] TO PUBLIC
    AS [dbo];

