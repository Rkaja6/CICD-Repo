CREATE TABLE [dbo].[UPS_GROGAN_DATA_POINTS] (
    [OBJECTID]          INT              NOT NULL,
    [OID_]              INT              NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Type]              NVARCHAR (50)    NULL,
    [Label]             NVARCHAR (50)    NULL,
    [Rotation]          NUMERIC (38, 8)  NULL,
    [X]                 NUMERIC (38, 8)  NULL,
    [Y]                 NUMERIC (38, 8)  NULL,
    [Lat]               NUMERIC (38, 8)  NULL,
    [Long]              NUMERIC (38, 8)  NULL,
    [Area]              NVARCHAR (50)    NULL,
    [Note]              NVARCHAR (100)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R626_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g589_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S589_idx]
    ON [dbo].[UPS_GROGAN_DATA_POINTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10380729.6406784, XMIN = -10414144.1235054, YMAX = 3798071.33390686, YMIN = 3747947.77393482),
            CELLS_PER_OBJECT = 16
          );

