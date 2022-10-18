CREATE TABLE [dbo].[TX_HAYNESVILLE_ACTIVE_UNITS] (
    [OBJECTID_1]        INT              NOT NULL,
    [VIEWID]            INT              NULL,
    [SDE_LEASE_]        NVARCHAR (25)    NULL,
    [LEASE_NUMB]        NVARCHAR (25)    NULL,
    [LEASE_STAT]        NVARCHAR (100)   NULL,
    [LEASE_ST_1]        NVARCHAR (30)    NULL,
    [CURRENT_NE]        NUMERIC (38, 8)  NULL,
    [EFFECTIVE_]        NVARCHAR (30)    NULL,
    [PRIMARY_TE]        NVARCHAR (30)    NULL,
    [LEASE_TYPE]        NVARCHAR (200)   NULL,
    [PRIMARY__1]        NVARCHAR (50)    NULL,
    [ALAMO_LEAS]        INT              NULL,
    [ORIGINAL_L]        NVARCHAR (254)   NULL,
    [LESSOR]            NVARCHAR (254)   NULL,
    [FIELD_NAME]        NVARCHAR (254)   NULL,
    [ALL_DEPTHS]        NVARCHAR (254)   NULL,
    [DEPTH_FROM]        NVARCHAR (254)   NULL,
    [DEPTH_TO]          NVARCHAR (254)   NULL,
    [DEP_FROM_F]        NVARCHAR (254)   NULL,
    [DEP_TO_FOR]        NVARCHAR (254)   NULL,
    [DEPTH_LAND]        NVARCHAR (254)   NULL,
    [DEPTH_FR_1]        NVARCHAR (254)   NULL,
    [DEPTH_TO_T]        NVARCHAR (254)   NULL,
    [UNIT_NAME]         NVARCHAR (100)   NULL,
    [UNIT_EFFEC]        NVARCHAR (30)    NULL,
    [UNIT_EXPIR]        NVARCHAR (30)    NULL,
    [UNIT_TOTAL]        NUMERIC (38, 8)  NULL,
    [UNIT_STATE]        NUMERIC (38, 8)  NULL,
    [UNIT_MINER]        NVARCHAR (50)    NULL,
    [UNIT_TYPE]         NVARCHAR (50)    NULL,
    [UNIT_STA_1]        NUMERIC (38, 8)  NULL,
    [UNIT_DEPTH]        NVARCHAR (254)   NULL,
    [UNIT_DEP_1]        NVARCHAR (254)   NULL,
    [APPLICATIO]        NVARCHAR (254)   NULL,
    [LEASE_UPDA]        NVARCHAR (254)   NULL,
    [LEASE_INPU]        NVARCHAR (254)   NULL,
    [LAND_TYPE]         NVARCHAR (10)    NULL,
    [COUNTY]            NVARCHAR (50)    NULL,
    [COMMENT]           NVARCHAR (254)   NULL,
    [last_edite]        DATETIME2 (7)    NULL,
    [last_edi_1]        NVARCHAR (254)   NULL,
    [OBJECTID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R69_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g59_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S59_idx]
    ON [dbo].[TX_HAYNESVILLE_ACTIVE_UNITS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

