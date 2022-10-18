CREATE TABLE [dbo].[OIL_AND_GAS_WELLS_REXTAG] (
    [OBJECTID]          INT              NOT NULL,
    [API_UNQSEQ]        NVARCHAR (25)    NULL,
    [API_NATFMT]        NVARCHAR (25)    NULL,
    [API_HRTSTD]        NVARCHAR (25)    NULL,
    [WELLNAME]          NVARCHAR (150)   NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (150)   NULL,
    [PREV_OPER]         NVARCHAR (100)   NULL,
    [COMMODITY]         NVARCHAR (15)    NULL,
    [COMM_STATE]        NVARCHAR (25)    NULL,
    [OPER_STAT]         NVARCHAR (15)    NULL,
    [STAT_STATE]        NVARCHAR (150)   NULL,
    [WELLDIRECT]        NVARCHAR (15)    NULL,
    [BH_Y_NAD83]        NUMERIC (38, 8)  NULL,
    [BH_X_NAD83]        NUMERIC (38, 8)  NULL,
    [COUNTY]            NVARCHAR (20)    NULL,
    [STATE_NAME]        NVARCHAR (25)    NULL,
    [COUNTRY]           NVARCHAR (50)    NULL,
    [API_COUNTY]        NVARCHAR (3)     NULL,
    [API_STATE]         NVARCHAR (2)     NULL,
    [FIPS_STATE]        NVARCHAR (2)     NULL,
    [UPDATE_NO]         INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R37_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g27_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S27_idx]
    ON [dbo].[OIL_AND_GAS_WELLS_REXTAG] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

