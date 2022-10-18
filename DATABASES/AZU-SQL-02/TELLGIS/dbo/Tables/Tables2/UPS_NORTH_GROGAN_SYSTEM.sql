CREATE TABLE [dbo].[UPS_NORTH_GROGAN_SYSTEM] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Dia]               SMALLINT         NULL,
    [Modified]          NVARCHAR (50)    NULL,
    [Agreement_No]      NVARCHAR (50)    NULL,
    [CAD_NO]            NVARCHAR (50)    NULL,
    [Miles]             NUMERIC (38, 8)  NULL,
    [Feet]              NUMERIC (38, 8)  NULL,
    [Notes]             NVARCHAR (50)    NULL,
    [Status]            NVARCHAR (25)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R630_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g593_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S593_idx]
    ON [dbo].[UPS_NORTH_GROGAN_SYSTEM] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10398074.3489256, XMIN = -10407543.6959189, YMAX = 3789639.64048655, YMIN = 3754277.80623906),
            CELLS_PER_OBJECT = 16
          );

