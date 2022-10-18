CREATE TABLE [dbo].[NON_OP_SECTIONS] (
    [OBJECTID]          INT              NOT NULL,
    [OID_]              INT              NULL,
    [Name]              NVARCHAR (254)   NULL,
    [SymbolID]          INT              NULL,
    [AltMode]           INT              NULL,
    [Base]              NUMERIC (38, 8)  NULL,
    [Clamped]           INT              NULL,
    [Extruded]          INT              NULL,
    [Snippet]           NVARCHAR (254)   NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Color]             NVARCHAR (10)    NULL,
    [Type]              NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R36_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g26_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S26_idx]
    ON [dbo].[NON_OP_SECTIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

