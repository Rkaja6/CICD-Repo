CREATE TABLE [CSV].[WaterProduction] (
    [Id]                         INT          NULL,
    [API Number]                 VARCHAR (40) NULL,
    [Year]                       SMALLINT     NULL,
    [Month]                      SMALLINT     NULL,
    [Production Forecast Group]  VARCHAR (2)  NULL,
    [Oil And Gas Group]          VARCHAR (2)  NULL,
    [Cumulative Calendar Months] BIGINT       NULL,
    [Production (Barrels)]       REAL         NULL,
    [TellurianUpdatedDate]       DATETIME     DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]       DATETIME     DEFAULT (getdate()) NULL
);

