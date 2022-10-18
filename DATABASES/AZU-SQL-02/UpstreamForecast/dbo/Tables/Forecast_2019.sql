CREATE TABLE [dbo].[Forecast_2019] (
    [ScenarioID]           INT              NULL,
    [SegmentID]            INT              NULL,
    [RigID]                INT              NULL,
    [ScenarioName]         VARCHAR (200)    NULL,
    [SegmentName]          VARCHAR (200)    NULL,
    [TPCPlayName]          VARCHAR (200)    NULL,
    [Basin]                VARCHAR (30)     NULL,
    [Operator]             VARCHAR (255)    NULL,
    [Area]                 VARCHAR (255)    NULL,
    [API]                  VARCHAR (50)     NULL,
    [SpudYear]             INT              NULL,
    [SpudDate]             DATE             NULL,
    [ProductionMonth]      DATE             NULL,
    [MonthlyProductionGas] DECIMAL (38, 16) NULL,
    [MonthlyProductionOil] DECIMAL (38, 16) NULL,
    [DailyRateGas]         DECIMAL (38, 16) NULL,
    [DailyRateOil]         DECIMAL (38, 16) NULL,
    [LastRunDate]          DATETIME         NULL
);

