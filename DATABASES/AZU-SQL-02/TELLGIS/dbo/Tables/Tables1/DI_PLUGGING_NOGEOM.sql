CREATE TABLE [dbo].[DI_PLUGGING_NOGEOM] (
    [OBJECTID]           INT             NOT NULL,
    [pluggingId]         INT             NOT NULL,
    [wellId]             INT             NOT NULL,
    [APIst]              NVARCHAR (2)    NULL,
    [APIcty]             NVARCHAR (3)    NULL,
    [API]                NVARCHAR (16)   NULL,
    [state]              NVARCHAR (5)    NOT NULL,
    [countyName]         NVARCHAR (63)   NOT NULL,
    [stateId]            INT             NOT NULL,
    [countyId]           INT             NOT NULL,
    [longitude]          NUMERIC (38, 8) NULL,
    [latitude]           NUMERIC (38, 8) NULL,
    [plugDate]           DATETIME2 (7)   NULL,
    [plugEventType]      INT             NOT NULL,
    [casingStatusTypeId] INT             NULL,
    [casingStatus]       NVARCHAR (32)   NULL,
    [operatorName]       NVARCHAR (255)  NULL,
    [operatorAlias]      NVARCHAR (255)  NULL,
    [totalDepth]         INT             NULL,
    [wellNumber]         NVARCHAR (32)   NULL,
    [currentLeaseName]   NVARCHAR (128)  NULL,
    [priorWellStatus]    NVARCHAR (100)  NULL,
    [currentWellStatus]  NVARCHAR (255)  NULL,
    [wellTotalDepth]     INT             NULL,
    [totalDepthType]     NVARCHAR (128)  NULL,
    [elevation]          INT             NULL,
    [elevationRef]       NVARCHAR (8)    NULL,
    [abstractNumber]     NVARCHAR (16)   NULL,
    [surveyName]         NVARCHAR (64)   NULL,
    [blockSection]       NVARCHAR (44)   NULL,
    [section]            NUMERIC (38, 8) NULL,
    [township]           NUMERIC (38, 8) NULL,
    [townshipDirection]  NVARCHAR (10)   NULL,
    [range]              NUMERIC (38, 8) NULL,
    [rangeDirection]     NVARCHAR (10)   NULL,
    [created]            DATETIME2 (7)   NULL,
    [updated]            DATETIME2 (7)   NULL,
    [plugMo]             INT             NULL,
    [plugYr]             INT             NULL,
    [abstractId]         INT             NULL,
    [diLink]             NVARCHAR (3999) NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [R128_SDE_ROWID_UK]
    ON [dbo].[DI_PLUGGING_NOGEOM]([OBJECTID] ASC) WITH (FILLFACTOR = 75);

