CREATE TABLE [CSV].[EconomicsCost] (
    [Id]                   INT          NULL,
    [API Number]           VARCHAR (40) NULL,
    [Well Cost Group]      VARCHAR (58) NULL,
    [Well Cost (MUSD)]     REAL         NULL,
    [Well Cost Category]   VARCHAR (58) NULL,
    [TellurianUpdatedDate] DATETIME     DEFAULT (getdate()) NULL,
    [TellurianCreatedDate] DATETIME     DEFAULT (getdate()) NULL
);

