CREATE TABLE [dbo].[WaterProduction] (
    [Id]                         BIGINT         NULL,
    [API_Number]                 NVARCHAR (MAX) NULL,
    [Year]                       SMALLINT       NULL,
    [Month]                      SMALLINT       NULL,
    [Production_Forecast_Group]  NVARCHAR (MAX) NULL,
    [Oil_And_Gas_Group]          NVARCHAR (MAX) NULL,
    [Cumulative_Calendar_Months] SMALLINT       NULL,
    [Production__Barrels_]       REAL           NULL,
    [TellurianUpdatedDate]       DATETIME       DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]       DATETIME       DEFAULT (getdate()) NULL
);

