CREATE TABLE [dbo].[GDB_ITEMTYPES] (
    [ObjectID]     INT              NOT NULL,
    [UUID]         UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (226)   NOT NULL,
    [ParentTypeID] UNIQUEIDENTIFIER NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [ItemTypes_ParentTypeID_idx]
    ON [dbo].[GDB_ITEMTYPES]([ParentTypeID] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [ItemTypes_Name_idx]
    ON [dbo].[GDB_ITEMTYPES]([Name] ASC) WITH (FILLFACTOR = 75);


GO
CREATE UNIQUE NONCLUSTERED INDEX [R7_SDE_ROWID_UK]
    ON [dbo].[GDB_ITEMTYPES]([ObjectID] ASC) WITH (FILLFACTOR = 75);


GO
CREATE UNIQUE CLUSTERED INDEX [ItemTypes_UUID_idx]
    ON [dbo].[GDB_ITEMTYPES]([UUID] ASC);


GO
CREATE TRIGGER GDB_ITEM_TYP_TR ON dbo.GDB_ITEMTYPES FOR INSERT, UPDATE, DELETE AS BEGIN 
SET NOCOUNT ON 
UPDATE dbo.GDB_TABLES_LAST_MODIFIED SET last_modified_count = last_modified_count + 1 WHERE table_name = 'GDB_ITEMTYPES' IF @@ROWCOUNT = 0 
BEGIN 
INSERT INTO dbo.GDB_TABLES_LAST_MODIFIED VALUES ('GDB_ITEMTYPES', 1) 
END 
END
GO
GRANT UPDATE
    ON OBJECT::[dbo].[GDB_ITEMTYPES] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GDB_ITEMTYPES] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GDB_ITEMTYPES] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[GDB_ITEMTYPES] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];

