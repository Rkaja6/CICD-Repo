CREATE TABLE [dbo].[TEL_TELLURIANOFFICES] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Address]           NVARCHAR (100)   NULL,
    [Time_Zone]         NVARCHAR (50)    NULL,
    [OfficePhone]       NVARCHAR (18)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R297_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g278_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S278_idx]
    ON [dbo].[TEL_TELLURIANOFFICES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 11561027.1623, XMIN = -10616410.4086, YMAX = 6711678.7216, YMIN = 142405.3774),
            CELLS_PER_OBJECT = 16
          );

