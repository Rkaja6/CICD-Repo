CREATE TABLE [dbo].[UPS_TYPECURVE_AREAS_HSVL] (
    [OBJECTID]          INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Val]               NUMERIC (38, 8)  NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [YE2019]            NUMERIC (38, 8)  NULL,
    [YE2020]            NUMERIC (38, 8)  NULL,
    [Shape_Le_1]        NUMERIC (38, 8)  NULL,
    [MY2021]            NUMERIC (38, 8)  NULL,
    [YE2021]            NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R645_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g608_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S608_idx]
    ON [dbo].[UPS_TYPECURVE_AREAS_HSVL] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10371076.8906372, XMIN = -10470525.6120431, YMAX = 3795998.70662562, YMIN = 3724000.01271274),
            CELLS_PER_OBJECT = 16
          );

