CREATE TABLE [dbo].[BMP_URBANAREAS] (
    [OBJECTID]          INT              NOT NULL,
    [UA_ID]             NVARCHAR (5)     NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [LSAD]              NVARCHAR (2)     NULL,
    [LSAD_DESC]         NVARCHAR (15)    NULL,
    [POP2010]           INT              NULL,
    [POP10_SQMI]        NUMERIC (38, 8)  NULL,
    [HSE_UNITS]         INT              NULL,
    [SQMI]              NUMERIC (38, 8)  NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R100_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g90_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S90_idx]
    ON [dbo].[BMP_URBANAREAS] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

