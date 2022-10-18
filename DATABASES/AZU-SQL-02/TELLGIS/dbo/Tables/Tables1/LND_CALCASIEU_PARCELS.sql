CREATE TABLE [dbo].[LND_CALCASIEU_PARCELS] (
    [OBJECTID_12]       INT              NOT NULL,
    [OBJECTID_1]        INT              NULL,
    [OBJECTID_2]        INT              NULL,
    [FID_1]             INT              NULL,
    [OBJECTID_3]        INT              NULL,
    [OBJECTID]          INT              NULL,
    [PIN]               NVARCHAR (24)    NULL,
    [NAME]              NVARCHAR (30)    NULL,
    [ADDRESS1]          NVARCHAR (30)    NULL,
    [ADDRESS2]          NVARCHAR (30)    NULL,
    [ASSESSMENT]        NVARCHAR (16)    NULL,
    [PHYSICALAD]        NVARCHAR (54)    NULL,
    [WARD]              NVARCHAR (16)    NULL,
    [DATE_]             NVARCHAR (50)    NULL,
    [Shape_STAr]        NUMERIC (38, 8)  NULL,
    [Shape_STLe]        NUMERIC (38, 8)  NULL,
    [FID_2]             INT              NULL,
    [ZONE]              NVARCHAR (6)     NULL,
    [Zn_Descr]          NVARCHAR (50)    NULL,
    [link]              NVARCHAR (50)    NULL,
    [PRIOR_ZONI]        NVARCHAR (50)    NULL,
    [DATE_CHANG]        DATETIME2 (7)    NULL,
    [ORD_NO]            NVARCHAR (50)    NULL,
    [Distance]          NUMERIC (38, 8)  NULL,
    [DESCRIPTIO]        NVARCHAR (254)   NULL,
    [Shape_ST_1]        NUMERIC (38, 8)  NULL,
    [Shape_ST_2]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R763_pk] PRIMARY KEY CLUSTERED ([OBJECTID_12] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g726_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S726_idx]
    ON [dbo].[LND_CALCASIEU_PARCELS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10340182.1356204, XMIN = -10437956.5099374, YMAX = 3566741.41681332, YMIN = 3508445.1008751)
          );

