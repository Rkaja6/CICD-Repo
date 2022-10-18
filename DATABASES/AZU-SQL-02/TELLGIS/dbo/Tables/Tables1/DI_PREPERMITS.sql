CREATE TABLE [dbo].[DI_PREPERMITS] (
    [OBJECTID]          INT              NOT NULL,
    [prepermitId]       INT              NOT NULL,
    [longitude]         NUMERIC (38, 8)  NULL,
    [latitude]          NUMERIC (38, 8)  NULL,
    [eventDate]         DATETIME2 (7)    NULL,
    [state]             NVARCHAR (5)     NOT NULL,
    [countyName]        NVARCHAR (63)    NOT NULL,
    [operatorName]      NVARCHAR (100)   NULL,
    [leaseName]         NVARCHAR (60)    NULL,
    [totaldepth]        INT              NULL,
    [wellnumber]        NVARCHAR (30)    NULL,
    [AbstractNo]        INT              NULL,
    [surveyName]        NVARCHAR (64)    NULL,
    [SurveySection]     NVARCHAR (16)    NULL,
    [eventMonth]        INT              NULL,
    [eventYear]         INT              NULL,
    [APIst]             NVARCHAR (2)     NULL,
    [APIcty]            NVARCHAR (3)     NULL,
    [stateId]           INT              NOT NULL,
    [countyId]          INT              NOT NULL,
    [abstractId]        INT              NULL,
    [created]           DATETIME2 (7)    NOT NULL,
    [updated]           DATETIME2 (7)    NOT NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R521_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g484_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S484_idx]
    ON [dbo].[DI_PREPERMITS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10417545.4801, XMIN = -12139172.8374, YMAX = 5013906.4435, YMIN = 2995230.0982),
            CELLS_PER_OBJECT = 16
          );

