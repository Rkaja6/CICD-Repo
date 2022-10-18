CREATE TABLE [dbo].[RXT_NG_ALT_FILLING_STATIONS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [FUELTYP_CD]        NVARCHAR (5)     NULL,
    [INTER]             NVARCHAR (254)   NULL,
    [PHONE]             NVARCHAR (35)    NULL,
    [STAT]              NVARCHAR (1)     NULL,
    [EXPECT_DT]         DATETIME2 (7)    NULL,
    [BD_BLENDS]         NVARCHAR (10)    NULL,
    [NGFILLTYPE]        NVARCHAR (1)     NULL,
    [GRPACCESS]         NVARCHAR (50)    NULL,
    [ACCESSTIME]        NVARCHAR (254)   NULL,
    [CARDS]             NVARCHAR (60)    NULL,
    [NG_PSI]            NUMERIC (38, 8)  NULL,
    [EVLVL1EVSE]        NVARCHAR (1)     NULL,
    [EVLVL2EVSE]        NVARCHAR (1)     NULL,
    [EVDCFSTCNT]        NVARCHAR (1)     NULL,
    [EVOTHER]           NVARCHAR (1)     NULL,
    [EVNETWORK]         NVARCHAR (1)     NULL,
    [EVNTWRKWEB]        NVARCHAR (1)     NULL,
    [DT_CONFIRM]        DATETIME2 (7)    NULL,
    [STATE]             NVARCHAR (30)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [RQCHECK]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R157_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g138_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S138_idx]
    ON [dbo].[RXT_NG_ALT_FILLING_STATIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7796130.0045, XMIN = -16688546.6996, YMAX = 8682039.8046, YMIN = 2987535.576),
            CELLS_PER_OBJECT = 16
          );

