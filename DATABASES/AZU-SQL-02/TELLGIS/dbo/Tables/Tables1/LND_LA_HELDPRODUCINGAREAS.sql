CREATE TABLE [dbo].[LND_LA_HELDPRODUCINGAREAS] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [SECTN]             NVARCHAR (12)    NULL,
    [TOWNSHIP]          NVARCHAR (12)    NULL,
    [RANGE]             NVARCHAR (12)    NULL,
    [S_T_R]             NVARCHAR (25)    NULL,
    [Adjusted_T]        NVARCHAR (50)    NULL,
    [TRS]               NVARCHAR (25)    NULL,
    [sec]               NVARCHAR (10)    NULL,
    [twp]               NVARCHAR (10)    NULL,
    [rng]               NVARCHAR (10)    NULL,
    [no]                INT              NULL,
    [MAP]               NVARCHAR (5)     NULL,
    [TRS2]              NVARCHAR (25)    NULL,
    [secx]              NVARCHAR (5)     NULL,
    [twpx]              NVARCHAR (5)     NULL,
    [rngx]              NVARCHAR (5)     NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R705_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g668_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S668_idx]
    ON [dbo].[LND_LA_HELDPRODUCINGAREAS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10361988.5102896, XMIN = -10468813.2996658, YMAX = 3863618.32979522, YMIN = 3714514.9398149)
          );

