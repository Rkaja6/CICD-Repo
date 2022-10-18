CREATE TABLE [dbo].[DFW_LCI_AOI_STRUCTURES] (
    [OBJECTID]          INT              NOT NULL,
    [BlockgroupID]      NVARCHAR (12)    NULL,
    [StateAbbrev]       NVARCHAR (2)     NULL,
    [Shape__Area]       NUMERIC (38, 8)  NULL,
    [Shape__Length]     NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R678_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g641_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S641_idx]
    ON [dbo].[DFW_LCI_AOI_STRUCTURES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389168.11, XMIN = -10393553.32, YMAX = 3518064.05, YMIN = 3513001.6)
          );

