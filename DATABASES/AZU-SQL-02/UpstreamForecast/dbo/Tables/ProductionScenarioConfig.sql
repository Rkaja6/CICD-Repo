CREATE TABLE [dbo].[ProductionScenarioConfig] (
    [ScenarioID]          INT              NOT NULL,
    [ScenarioName]        VARCHAR (200)    NULL,
    [SegmentID]           INT              NOT NULL,
    [SegmentName]         VARCHAR (200)    NULL,
    [SegmentType]         VARCHAR (40)     NULL,
    [TPCPlayName]         VARCHAR (500)    NULL,
    [Basin]               VARCHAR (30)     NULL,
    [Operator]            VARCHAR (255)    NULL,
    [Area]                VARCHAR (255)    NULL,
    [TypeCurveID]         INT              NULL,
    [ActualSpudStartDate] DATE             NULL,
    [ActualSpudEndDate]   DATE             NULL,
    [RigForecastID]       INT              NULL,
    [FlagRunSegment]      VARCHAR (1)      NULL,
    [LastRunDate]         DATETIME         NULL,
    [RigFcstMultiple]     DECIMAL (38, 16) NULL,
    CONSTRAINT [PK_ProductionScenarioConfig] PRIMARY KEY CLUSTERED ([ScenarioID] ASC, [SegmentID] ASC)
);

