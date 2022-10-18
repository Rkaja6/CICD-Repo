CREATE TABLE [CSV].[ProductionPreviousYear] (
    [Id]                         INT          NULL,
    [API Number]                 VARCHAR (40) NULL,
    [Year]                       SMALLINT     NULL,
    [Month]                      SMALLINT     NULL,
    [Production Forecast Group]  VARCHAR (2)  NULL,
    [Oil And Gas Group]          VARCHAR (2)  NULL,
    [Cumulative Calendar Months] SMALLINT     NULL,
    [Production (bbl boe)]       REAL         NULL,
    [Cumulative Calendar Years]  SMALLINT     NULL,
    [Production Phase]           VARCHAR (2)  NULL,
    [TellurianUpdatedDate]       DATETIME     DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]       DATETIME     DEFAULT (getdate()) NULL
);

