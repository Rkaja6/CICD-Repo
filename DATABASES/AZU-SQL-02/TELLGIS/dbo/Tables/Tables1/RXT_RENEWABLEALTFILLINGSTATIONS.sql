CREATE TABLE [dbo].[RXT_RENEWABLEALTFILLINGSTATIONS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [FUELTYP_CD]        NVARCHAR (35)    NULL,
    [INTER]             NVARCHAR (254)   NULL,
    [PHONE]             NVARCHAR (35)    NULL,
    [STATUS]            NVARCHAR (25)    NULL,
    [EXPECT_DT]         DATETIME2 (7)    NULL,
    [GRPACCESS]         NVARCHAR (35)    NULL,
    [ACCESSTIME]        NVARCHAR (150)   NULL,
    [CARDS]             NVARCHAR (150)   NULL,
    [BD_BLENDS]         NVARCHAR (35)    NULL,
    [EVLVL1EVSE]        NVARCHAR (2)     NULL,
    [EVLVL2EVSE]        NVARCHAR (3)     NULL,
    [EVDCFSTCNT]        NVARCHAR (2)     NULL,
    [EVOTHER]           NVARCHAR (50)    NULL,
    [EVNETWORK]         NVARCHAR (50)    NULL,
    [EVNTWRKWEB]        NVARCHAR (100)   NULL,
    [DT_CONFIRM]        DATETIME2 (7)    NULL,
    [HYSTATUSLINK]      NVARCHAR (100)   NULL,
    [E85BLNDPUMP]       NVARCHAR (5)     NULL,
    [EVCONTYPE]         NVARCHAR (50)    NULL,
    [E85OTHETHBLND]     NVARCHAR (50)    NULL,
    [EVPRICE]           NVARCHAR (254)   NULL,
    [HYPRESSURE]        NVARCHAR (20)    NULL,
    [HYSTANDARDS]       NVARCHAR (20)    NULL,
    [EVONSITERENEW]     NVARCHAR (5)     NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [CATCHALL]          NVARCHAR (500)   NULL,
    [CNTY_NAME]         NVARCHAR (60)    NULL,
    [STATE_NAME]        NVARCHAR (40)    NULL,
    [CNTRY_NAME]        NVARCHAR (40)    NULL,
    [UPDATE_NO]         NVARCHAR (4)     NULL,
    [QUALITY]           NVARCHAR (20)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R756_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g719_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S719_idx]
    ON [dbo].[RXT_RENEWABLEALTFILLINGSTATIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100)
          );

