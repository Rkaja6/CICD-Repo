CREATE TABLE [dbo].[UPS_LIGNITE_MINES] (
    [OBJECTID]          INT              NOT NULL,
    [PERMITTEE]         NVARCHAR (20)    NULL,
    [PERMIT_ID]         NVARCHAR (10)    NULL,
    [STATUS]            NVARCHAR (10)    NULL,
    [CONTACT]           NVARCHAR (10)    NULL,
    [NAT_ID]            NVARCHAR (10)    NULL,
    [DATE_STAT]         DATETIME2 (7)    NULL,
    [Name]              NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R582_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g545_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S545_idx]
    ON [dbo].[UPS_LIGNITE_MINES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10390549.5234108, XMIN = -10426452.3229912, YMAX = 3769738.213184, YMIN = 3751316.93587703),
            CELLS_PER_OBJECT = 16
          );

