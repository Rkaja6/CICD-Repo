CREATE TABLE [dbo].[LND_MAJOR_OPERATORS] (
    [OBJECTID]           INT              NOT NULL,
    [SECTN]              NVARCHAR (12)    NULL,
    [TOWNSHIP]           NVARCHAR (12)    NULL,
    [RANGE]              NVARCHAR (12)    NULL,
    [S_T_R]              NVARCHAR (25)    NULL,
    [Adjusted_To_Survey] NVARCHAR (50)    NULL,
    [TRS]                NVARCHAR (25)    NULL,
    [sec]                NVARCHAR (10)    NULL,
    [twp]                NVARCHAR (10)    NULL,
    [rng]                NVARCHAR (10)    NULL,
    [no]                 SMALLINT         NULL,
    [MAP]                NVARCHAR (5)     NULL,
    [TRS2]               NVARCHAR (25)    NULL,
    [secx]               NVARCHAR (5)     NULL,
    [twpx]               NVARCHAR (5)     NULL,
    [rngx]               NVARCHAR (5)     NULL,
    [OPERATOR]           NVARCHAR (75)    NULL,
    [Status]             NVARCHAR (25)    NULL,
    [Shape]              [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]  VARBINARY (MAX)  NULL,
    CONSTRAINT [R768_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g731_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S731_idx]
    ON [dbo].[LND_MAJOR_OPERATORS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10361988.5102896, XMIN = -10468813.2996658, YMAX = 3863618.32979522, YMIN = 3716408.55907805)
          );

