CREATE TABLE [dbo].[GEO_TELL_3D_SEISMICX] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [OID_]              INT              NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Date_Added]        NVARCHAR (20)    NULL,
    [sqmi]              NUMERIC (38, 8)  NULL,
    [Shape_Le_1]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R609_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g572_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S572_idx]
    ON [dbo].[GEO_TELL_3D_SEISMICX] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10372239.8044, XMIN = -10407558.9256, YMAX = 3794347.3242, YMIN = 3725852.1372),
            CELLS_PER_OBJECT = 16
          );

