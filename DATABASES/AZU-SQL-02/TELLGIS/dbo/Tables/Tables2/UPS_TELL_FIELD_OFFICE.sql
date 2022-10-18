CREATE TABLE [dbo].[UPS_TELL_FIELD_OFFICE] (
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
    [Tax_Name]          NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R759_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g722_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S722_idx]
    ON [dbo].[UPS_TELL_FIELD_OFFICE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10420852.3480524, XMIN = -10420852.7648865, YMAX = 3776562.13987714, YMIN = 3776561.98881465)
          );

