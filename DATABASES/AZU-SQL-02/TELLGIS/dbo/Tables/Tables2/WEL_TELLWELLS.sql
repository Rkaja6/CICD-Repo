CREATE TABLE [dbo].[WEL_TELLWELLS] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [Unit]              NVARCHAR (50)    NULL,
    [Well_Name]         NVARCHAR (50)    NULL,
    [Well_Type]         NVARCHAR (5)     NULL,
    [QF_Value]          SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R404_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g367_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S367_idx]
    ON [dbo].[WEL_TELLWELLS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10376590.2932682, XMIN = -10422288.8381458, YMAX = 3786930.60883861, YMIN = 3739179.24871641),
            CELLS_PER_OBJECT = 16
          );

