CREATE TABLE [dbo].[BMP_ENV_FWS_APPROVED_A] (
    [OBJECTID]          INT              NOT NULL,
    [CMPXNAME]          NVARCHAR (85)    NULL,
    [ORGNAME]           NVARCHAR (75)    NULL,
    [ORGCODE]           INT              NULL,
    [IFWS]              NVARCHAR (10)    NULL,
    [LIT]               NVARCHAR (3)     NULL,
    [GISACRES]          NUMERIC (38, 8)  NULL,
    [DOCACRES]          NUMERIC (38, 8)  NULL,
    [MAXACRES]          NUMERIC (38, 8)  NULL,
    [APPTYPE]           SMALLINT         NULL,
    [COMMENTS]          NVARCHAR (254)   NULL,
    [RSL_TYPE]          NVARCHAR (8)     NULL,
    [FWSREGION]         NVARCHAR (1)     NULL,
    [LABELNAME]         NVARCHAR (85)    NULL,
    [CreatedBy]         NVARCHAR (30)    NULL,
    [CreatedDat]        DATETIME2 (7)    NULL,
    [ModifiedBy]        NVARCHAR (30)    NULL,
    [ModifiedDa]        DATETIME2 (7)    NULL,
    [SHAPE_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R271_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g252_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S252_idx]
    ON [dbo].[BMP_ENV_FWS_APPROVED_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037504.3335, XMIN = -20037507.0672, YMAX = 11176785.7273, YMIN = -1638513.3344),
            CELLS_PER_OBJECT = 16
          );

