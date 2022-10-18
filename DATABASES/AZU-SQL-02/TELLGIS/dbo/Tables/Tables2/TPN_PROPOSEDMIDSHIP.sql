﻿CREATE TABLE [dbo].[TPN_PROPOSEDMIDSHIP] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R240_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g221_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S221_idx]
    ON [dbo].[TPN_PROPOSEDMIDSHIP] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10683645.3188111, XMIN = -10858025.9107583, YMAX = 4226417.78932712, YMIN = 4026203.95374598),
            CELLS_PER_OBJECT = 16
          );

