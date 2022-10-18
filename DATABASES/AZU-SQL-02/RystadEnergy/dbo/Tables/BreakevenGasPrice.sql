CREATE TABLE [dbo].[BreakevenGasPrice] (
    [Id]                                    BIGINT         NULL,
    [Wellhead_Breakeven_Gas_Price_Category] NVARCHAR (MAX) NULL,
    [Wellhead_Breakeven_Gas_Price_Detail]   NVARCHAR (MAX) NULL,
    [TellurianUpdatedDate]                  DATETIME       DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]                  DATETIME       DEFAULT (getdate()) NULL
);

