CREATE TABLE [dbo].[DFW_FACILITY] (
    [OBJECTID]          INT              NOT NULL,
    [FID_]              INT              NULL,
    [Entity]            NVARCHAR (16)    NULL,
    [Level_]            INT              NULL,
    [Layer]             NVARCHAR (254)   NULL,
    [Color]             INT              NULL,
    [Linetype]          NVARCHAR (254)   NULL,
    [Elevation]         NUMERIC (38, 8)  NULL,
    [LineWt]            INT              NULL,
    [RefName]           NVARCHAR (254)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R634_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g597_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S597_idx]
    ON [dbo].[DFW_FACILITY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10388566.4513698, XMIN = -10391747.1583342, YMAX = 3517002.06007578, YMIN = 3514273.30402638),
            CELLS_PER_OBJECT = 16
          );

