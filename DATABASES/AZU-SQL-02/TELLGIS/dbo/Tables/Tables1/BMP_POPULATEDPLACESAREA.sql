CREATE TABLE [dbo].[BMP_POPULATEDPLACESAREA] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (57)    NULL,
    [CLASS]             NVARCHAR (36)    NULL,
    [ST]                NVARCHAR (2)     NULL,
    [STFIPS]            NVARCHAR (2)     NULL,
    [PLACEFIPS]         NVARCHAR (7)     NULL,
    [HOUSEUNITS]        INT              NULL,
    [POPULATION]        INT              NULL,
    [POP_CLASS]         SMALLINT         NULL,
    [POP_SQMI]          NUMERIC (38, 8)  NULL,
    [SQMI]              NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R73_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g63_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S63_idx]
    ON [dbo].[BMP_POPULATEDPLACESAREA] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

