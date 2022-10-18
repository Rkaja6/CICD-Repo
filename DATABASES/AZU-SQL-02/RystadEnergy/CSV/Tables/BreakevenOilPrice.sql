CREATE TABLE [CSV].[BreakevenOilPrice] (
    [Id]                                    SMALLINT     NULL,
    [Wellhead Breakeven Oil Price Category] VARCHAR (28) NULL,
    [Wellhead Breakeven Oil Price Detail]   VARCHAR (30) NULL,
    [TellurianUpdatedDate]                  DATETIME     DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]                  DATETIME     DEFAULT (getdate()) NULL
);

