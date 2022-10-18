CREATE TABLE [dbo].[LND_MINOR_OPERATORS] (
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
    CONSTRAINT [R769_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g732_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S732_idx]
    ON [dbo].[LND_MINOR_OPERATORS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10363892.4112857, XMIN = -10468810.845893, YMAX = 3859749.17858521, YMIN = 3731562.49078155)
          );

