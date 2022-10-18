CREATE TABLE [dbo].[TPN_HUB] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Label]             NVARCHAR (25)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R236_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g217_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S217_idx]
    ON [dbo].[TPN_HUB] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10359025.5233394, XMIN = -11476159.4402844, YMAX = 3670633.84122017, YMIN = 3210809.76960834),
            CELLS_PER_OBJECT = 16
          );

