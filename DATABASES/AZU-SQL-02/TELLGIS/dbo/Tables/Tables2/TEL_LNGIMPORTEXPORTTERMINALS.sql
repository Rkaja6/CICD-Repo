CREATE TABLE [dbo].[TEL_LNGIMPORTEXPORTTERMINALS] (
    [OBJECTID]          INT              NOT NULL,
    [Facility]          NVARCHAR (254)   NULL,
    [Owner]             NVARCHAR (254)   NULL,
    [Operator]          NVARCHAR (254)   NULL,
    [City]              NVARCHAR (254)   NULL,
    [County]            NVARCHAR (254)   NULL,
    [State]             NVARCHAR (254)   NULL,
    [Latitude]          NUMERIC (38, 8)  NULL,
    [Longitude]         NUMERIC (38, 8)  NULL,
    [ImpExp]            NVARCHAR (254)   NULL,
    [Period]            INT              NULL,
    [Cap_Bcfd]          NUMERIC (38, 8)  NULL,
    [Liq_Bcfd]          NUMERIC (38, 8)  NULL,
    [Stora_MMcf]        NUMERIC (38, 8)  NULL,
    [Source]            NVARCHAR (254)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R298_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g279_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S279_idx]
    ON [dbo].[TEL_LNGIMPORTEXPORTTERMINALS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7832428.24026565, XMIN = -16852081.0762314, YMAX = 8552450.07081706, YMIN = 3367261.1123393),
            CELLS_PER_OBJECT = 16
          );

