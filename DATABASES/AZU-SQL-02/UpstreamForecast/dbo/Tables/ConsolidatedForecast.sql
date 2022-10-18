CREATE TABLE [dbo].[ConsolidatedForecast] (
    [ScenarioID]           INT              NULL,
    [SegmentID]            INT              NULL,
    [RigID]                INT              NULL,
    [API]                  VARCHAR (50)     NULL,
    [SpudDate]             DATE             NULL,
    [SpudYear]             INT              NULL,
    [IntervalNumber]       INT              NULL,
    [ProductionMonth]      DATE             NULL,
    [MonthlyProductionGas] DECIMAL (38, 16) NULL,
    [MonthlyProductionOil] DECIMAL (38, 16) NULL,
    [DailyRateGas]         DECIMAL (38, 16) NULL,
    [DailyRateOil]         DECIMAL (38, 16) NULL,
    [TPCPlayName]          VARCHAR (200)    NULL,
    [Basin]                VARCHAR (30)     NULL,
    [Operator]             VARCHAR (255)    NULL,
    [Area]                 VARCHAR (255)    NULL
);

