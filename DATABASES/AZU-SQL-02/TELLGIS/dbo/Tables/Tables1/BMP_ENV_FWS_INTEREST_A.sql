CREATE TABLE [dbo].[BMP_ENV_FWS_INTEREST_A] (
    [OBJECTID]          INT              NOT NULL,
    [CMPXNAME]          NVARCHAR (85)    NULL,
    [ORGNAME]           NVARCHAR (75)    NULL,
    [DIVNAME]           NVARCHAR (85)    NULL,
    [UNITNAME]          NVARCHAR (75)    NULL,
    [SUBUNAME]          NVARCHAR (50)    NULL,
    [ORGCODE]           INT              NULL,
    [MGMTCODE]          INT              NULL,
    [IFWS]              NVARCHAR (10)    NULL,
    [LIT]               NVARCHAR (3)     NULL,
    [SWENR]             NVARCHAR (8)     NULL,
    [SGRNR]             NVARCHAR (8)     NULL,
    [GISACRES]          NUMERIC (38, 8)  NULL,
    [DOCACRES]          NUMERIC (38, 8)  NULL,
    [SURACRES]          NUMERIC (38, 8)  NULL,
    [STATUS]            SMALLINT         NULL,
    [INTTYPE1]          NVARCHAR (1)     NULL,
    [INTTYPE2]          NVARCHAR (3)     NULL,
    [TRACTNO]           NVARCHAR (15)    NULL,
    [INTIDNO]           NVARCHAR (25)    NULL,
    [RELICODE]          NVARCHAR (2)     NULL,
    [COMMENTS]          NVARCHAR (254)   NULL,
    [RSL_TYPE]          NVARCHAR (8)     NULL,
    [FWSREGION]         NVARCHAR (1)     NULL,
    [LM_VIEW]           NVARCHAR (5)     NULL,
    [CreatedBy]         NVARCHAR (30)    NULL,
    [CreatedDat]        DATETIME2 (7)    NULL,
    [ModifiedBy]        NVARCHAR (30)    NULL,
    [ModifiedDa]        DATETIME2 (7)    NULL,
    [SHAPE_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R272_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g253_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S253_idx]
    ON [dbo].[BMP_ENV_FWS_INTEREST_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037505.7003, XMIN = -20037507.0672, YMAX = 11124428.7078, YMIN = -1638513.3344),
            CELLS_PER_OBJECT = 16
          );

