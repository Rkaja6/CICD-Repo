CREATE TABLE [dbo].[ProductionForecast] (
    [Id]                         BIGINT         NULL,
    [API_Number]                 NVARCHAR (MAX) NULL,
    [Year]                       SMALLINT       NULL,
    [Month]                      SMALLINT       NULL,
    [Production_Forecast_Group]  NVARCHAR (MAX) NULL,
    [Oil_And_Gas_Group]          NVARCHAR (MAX) NULL,
    [Cumulative_Calendar_Months] SMALLINT       NULL,
    [Production__bbl_boe_]       REAL           NULL,
    [Cumulative_Calendar_Years]  SMALLINT       NULL,
    [Production_Phase]           NVARCHAR (MAX) NULL,
    [TellurianUpdatedDate]       DATETIME       DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]       DATETIME       DEFAULT (getdate()) NULL
);

