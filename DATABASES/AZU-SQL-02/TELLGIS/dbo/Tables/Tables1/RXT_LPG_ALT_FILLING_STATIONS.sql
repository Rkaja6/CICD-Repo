CREATE TABLE [dbo].[RXT_LPG_ALT_FILLING_STATIONS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [FUELTYP_CD]        NVARCHAR (5)     NULL,
    [INTER]             NVARCHAR (254)   NULL,
    [PHONE]             NVARCHAR (35)    NULL,
    [STAT]              NVARCHAR (1)     NULL,
    [EXPECT_DT]         NVARCHAR (10)    NULL,
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
    [EVNETWORK]         NVARCHAR (254)   NULL,
    [EVNTWRKWEB]        NVARCHAR (1)     NULL,
    [DT_CONFIRM]        DATETIME2 (7)    NULL,
    [STATE]             NVARCHAR (30)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [RQCHECK]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R155_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g136_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S136_idx]
    ON [dbo].[RXT_LPG_ALT_FILLING_STATIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7570894.3288, XMIN = -17577008.7397, YMAX = 9559048.3571, YMIN = 666246.770599999),
            CELLS_PER_OBJECT = 16
          );

