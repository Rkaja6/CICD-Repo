CREATE TABLE [dbo].[RXT_LPGFILLINGSTATIONS] (
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
    [DT_CONFIRM]        DATETIME2 (7)    NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [CATCHALL]          NVARCHAR (500)   NULL,
    [CNTY_NAME]         NVARCHAR (60)    NULL,
    [STATE_NAME]        NVARCHAR (40)    NULL,
    [CNTRY_NAME]        NVARCHAR (40)    NULL,
    [UPDATE_NO]         NVARCHAR (4)     NULL,
    [QUALITY]           NVARCHAR (20)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R235_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g207_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S207_idx]
    ON [dbo].[RXT_LPGFILLINGSTATIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -6887631.7276, XMIN = -15036801.1522, YMAX = 8971889.3407, YMIN = 2937113.6929)
          );

