CREATE TABLE [dbo].[RXT_PETROCHEMICAL_FAC] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [NAICS]             NUMERIC (38, 8)  NULL,
    [TOTREL4YR]         NUMERIC (38, 8)  NULL,
    [METHANOL]          NVARCHAR (3)     NULL,
    [AMMONIA]           NVARCHAR (3)     NULL,
    [STYRENE]           NVARCHAR (3)     NULL,
    [XYLENE]            NVARCHAR (3)     NULL,
    [TOLUENE]           NVARCHAR (3)     NULL,
    [ETHGLYCOL]         NVARCHAR (3)     NULL,
    [BENZENE]           NVARCHAR (3)     NULL,
    [FORMALDEHY]        NVARCHAR (3)     NULL,
    [HEXANE]            NVARCHAR (3)     NULL,
    [BENZOPERYL]        NVARCHAR (3)     NULL,
    [DIISOCYANA]        NVARCHAR (3)     NULL,
    [ETHYLENE]          NVARCHAR (3)     NULL,
    [BUTADIENE]         NVARCHAR (3)     NULL,
    [NAPHTHALEN]        NVARCHAR (3)     NULL,
    [PROPYLENE]         NVARCHAR (3)     NULL,
    [TOPCHEM]           NVARCHAR (3)     NULL,
    [STATE]             NVARCHAR (30)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [NOTES]             NVARCHAR (150)   NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [RQCHECK]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R168_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g149_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S149_idx]
    ON [dbo].[RXT_PETROCHEMICAL_FAC] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7204026.3752, XMIN = -18592169.4702, YMAX = 10468417.5086, YMIN = 2002935.8322),
            CELLS_PER_OBJECT = 16
          );

