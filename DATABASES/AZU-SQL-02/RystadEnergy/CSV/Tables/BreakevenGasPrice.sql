CREATE TABLE [CSV].[BreakevenGasPrice] (
    [Id]                                    SMALLINT     NULL,
    [Wellhead Breakeven Gas Price Category] VARCHAR (26) NULL,
    [Wellhead Breakeven Gas Price Detail]   VARCHAR (26) NULL,
    [TellurianUpdatedDate]                  DATETIME     DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]                  DATETIME     DEFAULT (getdate()) NULL
);

