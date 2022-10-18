CREATE TABLE [dbo].[DFW_LCI_USAMAJORHIGHWAYS] (
    [OBJECTID]          INT              NOT NULL,
    [PREFIX]            NVARCHAR (2)     NULL,
    [PRETYPE]           NVARCHAR (6)     NULL,
    [NAME]              NVARCHAR (30)    NULL,
    [TYPE]              NVARCHAR (6)     NULL,
    [SUFFIX]            NVARCHAR (2)     NULL,
    [CLASS]             NVARCHAR (1)     NULL,
    [CLASS_RTE]         NVARCHAR (1)     NULL,
    [HWY_TYPE]          NVARCHAR (1)     NULL,
    [HWY_SYMBOL]        NVARCHAR (20)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R676_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g639_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S639_idx]
    ON [dbo].[DFW_LCI_USAMAJORHIGHWAYS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10383833.8030668, XMIN = -10415934.8933133, YMAX = 3529955.27818383, YMIN = 3510190.03292132)
          );

