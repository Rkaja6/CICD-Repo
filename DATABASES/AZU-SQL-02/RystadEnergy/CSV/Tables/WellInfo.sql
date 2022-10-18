CREATE TABLE [CSV].[WellInfo] (
    [Id]                         INT           NULL,
    [API Number]                 VARCHAR (36)  NULL,
    [Year]                       SMALLINT      NULL,
    [Month]                      SMALLINT      NULL,
    [Oil And Gas Group]          VARCHAR (MAX) NULL,
    [Cumulative Calendar Months] BIGINT        NULL,
    [Cumulative Calendar Years]  BIGINT        NULL,
    [Rig Demand]                 REAL          NULL,
    [Spudded Wells]              SMALLINT      NULL,
    [Completed Wells]            SMALLINT      NULL,
    [Started Wells]              SMALLINT      NULL,
    [Producing Wells]            SMALLINT      NULL,
    [TellurianCreatedDate]       DATETIME      DEFAULT (getdate()) NULL,
    [TellurianUpdatedDate]       DATETIME      DEFAULT (getdate()) NULL
);

