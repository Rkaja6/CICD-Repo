CREATE TABLE [dbo].[WEL_FEATSVCTEST] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [Unit]              NVARCHAR (50)    NULL,
    [Well_Name]         NVARCHAR (50)    NULL,
    [Well_Type]         NVARCHAR (5)     NULL,
    [QF_Value]          SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R426_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g389_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S389_idx]
    ON [dbo].[WEL_FEATSVCTEST] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10376590.5008, XMIN = -10422288.6297, YMAX = 3786930.5331, YMIN = 3739179.3235),
            CELLS_PER_OBJECT = 16
          );

