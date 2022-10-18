CREATE TABLE [dbo].[GDB_ITEMS] (
    [ObjectID]        INT              NOT NULL,
    [UUID]            UNIQUEIDENTIFIER NOT NULL,
    [Type]            UNIQUEIDENTIFIER NOT NULL,
    [Name]            NVARCHAR (226)   NULL,
    [PhysicalName]    NVARCHAR (226)   NULL,
    [Path]            NVARCHAR (512)   NULL,
    [Url]             NVARCHAR (255)   NULL,
    [Properties]      INT              NULL,
    [Defaults]        VARBINARY (MAX)  NULL,
    [DatasetSubtype1] INT              NULL,
    [DatasetSubtype2] INT              NULL,
    [DatasetInfo1]    NVARCHAR (255)   NULL,
    [DatasetInfo2]    NVARCHAR (255)   NULL,
    [Definition]      XML              NULL,
    [Documentation]   XML              NULL,
    [ItemInfo]        XML              NULL,
    [Shape]           [sys].[geometry] NULL,
    CONSTRAINT [R5_pk] PRIMARY KEY CLUSTERED ([ObjectID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g1_ck] CHECK ([Shape].[STSrid]=(4326))
);


GO
CREATE NONCLUSTERED INDEX [Items_PhysicalName_idx]
    ON [dbo].[GDB_ITEMS]([PhysicalName] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [Items_Name_idx]
    ON [dbo].[GDB_ITEMS]([Name] ASC) WITH (FILLFACTOR = 75);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GDB_Items_UUID_idx]
    ON [dbo].[GDB_ITEMS]([UUID] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [Items_Type_idx]
    ON [dbo].[GDB_ITEMS]([Type] ASC) WITH (FILLFACTOR = 75);


GO
CREATE XML INDEX [xmlval_GDB_ITEMS_ItemInfo]
    ON [dbo].[GDB_ITEMS]([ItemInfo])
    USING XML INDEX [xmlprim_GDB_ITEMS_ItemInfo] FOR VALUE
    WITH (PAD_INDEX = OFF);


GO
CREATE XML INDEX [xmlpath_GDB_ITEMS_ItemInfo]
    ON [dbo].[GDB_ITEMS]([ItemInfo])
    USING XML INDEX [xmlprim_GDB_ITEMS_ItemInfo] FOR PATH
    WITH (PAD_INDEX = OFF);


GO
CREATE PRIMARY XML INDEX [xmlprim_GDB_ITEMS_ItemInfo]
    ON [dbo].[GDB_ITEMS]([ItemInfo])
    WITH (PAD_INDEX = OFF);


GO
CREATE XML INDEX [xmlval_GDB_ITEMS_Documentation]
    ON [dbo].[GDB_ITEMS]([Documentation])
    USING XML INDEX [xmlprim_GDB_ITEMS_Documentation] FOR VALUE
    WITH (PAD_INDEX = OFF);


GO
CREATE XML INDEX [xmlpath_GDB_ITEMS_Documentation]
    ON [dbo].[GDB_ITEMS]([Documentation])
    USING XML INDEX [xmlprim_GDB_ITEMS_Documentation] FOR PATH
    WITH (PAD_INDEX = OFF);


GO
CREATE PRIMARY XML INDEX [xmlprim_GDB_ITEMS_Documentation]
    ON [dbo].[GDB_ITEMS]([Documentation])
    WITH (PAD_INDEX = OFF);


GO
CREATE XML INDEX [xmlval_GDB_ITEMS_Definition]
    ON [dbo].[GDB_ITEMS]([Definition])
    USING XML INDEX [xmlprim_GDB_ITEMS_Definition] FOR VALUE
    WITH (PAD_INDEX = OFF);


GO
CREATE XML INDEX [xmlpath_GDB_ITEMS_Definition]
    ON [dbo].[GDB_ITEMS]([Definition])
    USING XML INDEX [xmlprim_GDB_ITEMS_Definition] FOR PATH
    WITH (PAD_INDEX = OFF);


GO
CREATE PRIMARY XML INDEX [xmlprim_GDB_ITEMS_Definition]
    ON [dbo].[GDB_ITEMS]([Definition])
    WITH (PAD_INDEX = OFF);


GO
CREATE SPATIAL INDEX [S1_idx]
    ON [dbo].[GDB_ITEMS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 400, XMIN = -400, YMAX = 90, YMIN = -90),
            CELLS_PER_OBJECT = 16
          );


GO
CREATE TRIGGER GDB_ITEMS_TAB_TR ON dbo.GDB_ITEMS FOR INSERT, UPDATE, DELETE AS BEGIN 
SET NOCOUNT ON 
IF (SELECT COUNT(*) from inserted WHERE Type NOT IN ('4ED4A58E-621F-4043-95ED-850FBA45FCBC', 'D98421EB-D582-4713-9484-43304D0810F6','DC64B6E4-DC0F-43BD-B4F5-F22385DCF055','5B966567-FB87-4DDE-938B-B4B37423539D','D86502F9-9758-45C6-9D23-6DD1A0107B47')) > 0  OR 
(SELECT COUNT(*) from deleted WHERE Type NOT IN ('4ED4A58E-621F-4043-95ED-850FBA45FCBC', 'D98421EB-D582-4713-9484-43304D0810F6','DC64B6E4-DC0F-43BD-B4F5-F22385DCF055','5B966567-FB87-4DDE-938B-B4B37423539D','D86502F9-9758-45C6-9D23-6DD1A0107B47')) > 0 
 BEGIN 
UPDATE dbo.GDB_TABLES_LAST_MODIFIED SET last_modified_count = last_modified_count + 1 WHERE table_name = 'GDB_ITEMS' IF @@ROWCOUNT = 0 
BEGIN 
INSERT INTO dbo.GDB_TABLES_LAST_MODIFIED VALUES ('GDB_ITEMS', 1) 
END 
END END
GO
GRANT UPDATE
    ON OBJECT::[dbo].[GDB_ITEMS] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GDB_ITEMS] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GDB_ITEMS] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[GDB_ITEMS] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];

