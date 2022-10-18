CREATE TABLE [dbo].[VINE_ACRES_BY_SECTION] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [SECTN]             NVARCHAR (12)    NULL,
    [TOWNSHIP]          NVARCHAR (12)    NULL,
    [RANGE]             NVARCHAR (12)    NULL,
    [HYPERLINK]         NVARCHAR (200)   NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [OPERATOR]          NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R101_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g91_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S91_idx]
    ON [dbo].[VINE_ACRES_BY_SECTION] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

