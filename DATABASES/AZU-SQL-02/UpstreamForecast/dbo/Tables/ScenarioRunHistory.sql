CREATE TABLE [dbo].[ScenarioRunHistory] (
    [RunID]               INT              IDENTITY (1, 1) NOT NULL,
    [RunDate]             DATETIME         NOT NULL,
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
    [RigFcstMultiple]     DECIMAL (38, 16) NULL,
    CONSTRAINT [PK_ScenarioRunHistory] PRIMARY KEY CLUSTERED ([RunID] ASC)
);

