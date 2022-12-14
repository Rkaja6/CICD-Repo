CREATE TABLE [dbo].[BMP_ENV_FWS_SPECIAL_DESIGNATION_A] (
    [OBJECTID]          INT              NOT NULL,
    [CMPXNAME]          NVARCHAR (85)    NULL,
    [ORGNAME]           NVARCHAR (75)    NULL,
    [ORGCODE]           INT              NULL,
    [MGMTCODE]          INT              NULL,
    [IFWS]              NVARCHAR (10)    NULL,
    [LIT]               NVARCHAR (3)     NULL,
    [GISACRES]          NUMERIC (38, 8)  NULL,
    [DOCACRES]          NUMERIC (38, 8)  NULL,
    [DOCNUM]            NVARCHAR (25)    NULL,
    [DESNAME]           NVARCHAR (254)   NULL,
    [DESTYPE]           NVARCHAR (50)    NULL,
    [DESDATE]           DATETIME2 (7)    NULL,
    [REACHMIL]          INT              NULL,
    [COMMENTS]          NVARCHAR (254)   NULL,
    [RSL_TYPE]          NVARCHAR (8)     NULL,
    [FWSREGION]         NVARCHAR (1)     NULL,
    [CreatedBy]         NVARCHAR (30)    NULL,
    [CreatedDat]        DATETIME2 (7)    NULL,
    [ModifiedBy]        NVARCHAR (30)    NULL,
    [ModifiedDa]        DATETIME2 (7)    NULL,
    [SHAPE_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R273_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g254_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S254_idx]
    ON [dbo].[BMP_ENV_FWS_SPECIAL_DESIGNATION_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037505.7003, XMIN = -20037507.0672, YMAX = 11124309.8146, YMIN = -1733737.8192),
            CELLS_PER_OBJECT = 16
          );

