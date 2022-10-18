﻿CREATE TABLE [dbo].[BMP_ENV_STATE_OWNED_LEASED_LANDS_LA_A] (
    [OBJECTID]          INT              NOT NULL,
    [SITE_CODE]         NVARCHAR (16)    NULL,
    [FACILITY_N]        NVARCHAR (254)   NULL,
    [Acres]             NUMERIC (38, 8)  NULL,
    [Uniq]              NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R281_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g262_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S262_idx]
    ON [dbo].[BMP_ENV_STATE_OWNED_LEASED_LANDS_LA_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9891972.355, XMIN = -11676263.1898, YMAX = 4677539.2332, YMIN = 3366721.7872),
            CELLS_PER_OBJECT = 16
          );

