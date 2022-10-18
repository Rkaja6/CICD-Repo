CREATE TABLE [dbo].[UPS_TELL_PROPOSED] (
    [OBJECTID]          INT              NOT NULL,
    [Well_Name]         NVARCHAR (255)   NULL,
    [Formation]         NVARCHAR (10)    NULL,
    [Status]            NVARCHAR (10)    NULL,
    [LAT]               NUMERIC (38, 8)  NULL,
    [LONG]              NUMERIC (38, 8)  NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R760_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g723_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S723_idx]
    ON [dbo].[UPS_TELL_PROPOSED] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = -10388915.5845013, XMIN = -10403020.4804459, YMAX = 3822925.27366931, YMIN = 3744977.38684542)
          );

