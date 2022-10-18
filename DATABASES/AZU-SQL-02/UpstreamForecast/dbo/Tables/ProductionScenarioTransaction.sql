CREATE TABLE [dbo].[ProductionScenarioTransaction] (
    [RigID]                  INT              NULL,
    [RunDateTime]            DATETIME         NULL,
    [DefaultProjectionYears] INT              NULL,
    [TPCPlayName]            VARCHAR (200)    NULL,
    [API]                    VARCHAR (50)     NULL,
    [SpudYear]               INT              NULL,
    [ProductionMonth]        DATE             NULL,
    [MonthlyProduction]      DECIMAL (38, 16) NULL,
    [SpudDate]               DATE             NULL
);

