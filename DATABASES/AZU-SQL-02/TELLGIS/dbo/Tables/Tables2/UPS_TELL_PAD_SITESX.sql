CREATE TABLE [dbo].[UPS_TELL_PAD_SITESX] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Type]              NVARCHAR (50)    NULL,
    [Drill_Order]       NVARCHAR (5)     NULL,
    [Status]            NVARCHAR (10)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R622_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g585_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S585_idx]
    ON [dbo].[UPS_TELL_PAD_SITESX] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10382631.6798858, XMIN = -10403882.42102, YMAX = 3786624.60678623, YMIN = 3743109.27365374),
            CELLS_PER_OBJECT = 16
          );

