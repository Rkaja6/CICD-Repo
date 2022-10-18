CREATE TABLE [dbo].[DI_PREPERMITS_NOGEOM] (
    [OBJECTID]      INT             NOT NULL,
    [prepermitId]   INT             NOT NULL,
    [longitude]     NUMERIC (38, 8) NULL,
    [latitude]      NUMERIC (38, 8) NULL,
    [eventDate]     DATETIME2 (7)   NULL,
    [state]         NVARCHAR (5)    NOT NULL,
    [countyName]    NVARCHAR (63)   NOT NULL,
    [operatorName]  NVARCHAR (100)  NULL,
    [leaseName]     NVARCHAR (60)   NULL,
    [totaldepth]    INT             NULL,
    [wellnumber]    NVARCHAR (30)   NULL,
    [AbstractNo]    INT             NULL,
    [surveyName]    NVARCHAR (64)   NULL,
    [SurveySection] NVARCHAR (16)   NULL,
    [eventMonth]    INT             NULL,
    [eventYear]     INT             NULL,
    [APIst]         NVARCHAR (2)    NULL,
    [APIcty]        NVARCHAR (3)    NULL,
    [stateId]       INT             NOT NULL,
    [countyId]      INT             NOT NULL,
    [abstractId]    INT             NULL,
    [created]       DATETIME2 (7)   NOT NULL,
    [updated]       DATETIME2 (7)   NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [R129_SDE_ROWID_UK]
    ON [dbo].[DI_PREPERMITS_NOGEOM]([OBJECTID] ASC) WITH (FILLFACTOR = 75);

