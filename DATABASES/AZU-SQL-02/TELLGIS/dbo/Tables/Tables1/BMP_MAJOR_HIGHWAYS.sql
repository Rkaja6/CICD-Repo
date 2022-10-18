CREATE TABLE [dbo].[BMP_MAJOR_HIGHWAYS] (
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
    CONSTRAINT [R667_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g630_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S630_idx]
    ON [dbo].[BMP_MAJOR_HIGHWAYS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7456384.8884131, XMIN = -17786619.1309909, YMAX = 9829631.80217773, YMIN = 2161775.30289057)
          );

