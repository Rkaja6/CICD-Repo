CREATE TABLE [dbo].[RXT_ABSTRACTSURVEY] (
    [OBJECTID]          INT              NOT NULL,
    [AREA]              NUMERIC (38, 8)  NULL,
    [PERIMETER]         NUMERIC (38, 8)  NULL,
    [ABSTRACT_]         NUMERIC (38, 8)  NULL,
    [ABSTRACT_I]        NUMERIC (38, 8)  NULL,
    [ANUM]              NVARCHAR (12)    NULL,
    [L1SURNAM]          NVARCHAR (32)    NULL,
    [L2BLOCK]           NVARCHAR (10)    NULL,
    [L3SURNUM]          NVARCHAR (8)     NULL,
    [L4SURNAM]          NVARCHAR (32)    NULL,
    [L5SFORMF]          NVARCHAR (9)     NULL,
    [PROBFLAG]          NVARCHAR (1)     NULL,
    [DUPLICAT]          NVARCHAR (1)     NULL,
    [CONTROL_NU]        NVARCHAR (9)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R246_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g227_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S227_idx]
    ON [dbo].[RXT_ABSTRACTSURVEY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10409301.914, XMIN = -11871776.7274, YMAX = 4369713.5446, YMIN = 2978957.0014),
            CELLS_PER_OBJECT = 16
          );

