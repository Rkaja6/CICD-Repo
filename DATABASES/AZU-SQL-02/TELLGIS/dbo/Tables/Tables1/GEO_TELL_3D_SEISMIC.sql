CREATE TABLE [dbo].[GEO_TELL_3D_SEISMIC] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [Name]              NVARCHAR (60)    NULL,
    [OID_]              INT              NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Date_Added]        NVARCHAR (20)    NULL,
    [sqmi]              NUMERIC (38, 8)  NULL,
    [Shape_Le_1]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R696_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g659_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S659_idx]
    ON [dbo].[GEO_TELL_3D_SEISMIC] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10372239.8044192, XMIN = -10407558.9255816, YMAX = 3794347.32421108, YMIN = 3725852.13716652)
          );

