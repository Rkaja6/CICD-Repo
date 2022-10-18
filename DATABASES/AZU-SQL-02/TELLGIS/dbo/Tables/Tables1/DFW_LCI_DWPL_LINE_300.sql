﻿CREATE TABLE [dbo].[DFW_LCI_DWPL_LINE_300] (
    [OBJECTID]          INT              NOT NULL,
    [Name]              NVARCHAR (50)    NULL,
    [Equation]          NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R683_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g646_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S646_idx]
    ON [dbo].[DFW_LCI_DWPL_LINE_300] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10379441.7150358, XMIN = -10397580.520065, YMAX = 3558795.00868115, YMIN = 3516890.42691209)
          );

