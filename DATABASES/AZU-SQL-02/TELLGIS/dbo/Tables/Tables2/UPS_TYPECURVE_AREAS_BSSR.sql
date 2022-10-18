CREATE TABLE [dbo].[UPS_TYPECURVE_AREAS_BSSR] (
    [OBJECTID]          INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Val]               NUMERIC (38, 8)  NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [YE2019]            NUMERIC (38, 8)  NULL,
    [YE2020]            NUMERIC (38, 8)  NULL,
    [Shape_Le_1]        NUMERIC (38, 8)  NULL,
    [YE2021]            NUMERIC (38, 8)  NULL,
    [YE2021Name]        NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R644_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g607_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S607_idx]
    ON [dbo].[UPS_TYPECURVE_AREAS_BSSR] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10365661.7314378, XMIN = -10420771.2141224, YMAX = 3795725.46309914, YMIN = 3723096.56326563),
            CELLS_PER_OBJECT = 16
          );

