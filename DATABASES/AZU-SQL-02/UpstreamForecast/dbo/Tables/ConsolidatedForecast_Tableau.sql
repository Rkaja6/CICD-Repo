CREATE TABLE [dbo].[ConsolidatedForecast_Tableau] (
    [ScenarioName]               VARCHAR (200)    NULL,
    [SegmentName]                VARCHAR (200)    NULL,
    [TPCPlayName]                VARCHAR (200)    NULL,
    [SpudYear]                   INT              NULL,
    [ProductionMonth]            DATE             NULL,
    [MonthlyProductionGas]       DECIMAL (38, 16) NULL,
    [MonthlyProductionOil]       DECIMAL (38, 16) NULL,
    [DailyRateGas]               DECIMAL (38, 16) NULL,
    [DailyRateOil]               DECIMAL (38, 16) NULL,
    [MonthlyProdGas_PriorYear]   DECIMAL (38, 16) NULL,
    [MonthlyProdOil_PriorYear]   DECIMAL (38, 16) NULL,
    [MonthlyProdGas_CurrentYear] DECIMAL (38, 16) NULL,
    [MonthlyProdOil_CurrentYear] DECIMAL (38, 16) NULL,
    [MonthlyProdGas_Future]      DECIMAL (38, 16) NULL,
    [MonthlyProdOil_Future]      DECIMAL (38, 16) NULL
);

