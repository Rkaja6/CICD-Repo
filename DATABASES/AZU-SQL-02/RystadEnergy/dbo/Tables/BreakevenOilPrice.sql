CREATE TABLE [dbo].[BreakevenOilPrice] (
    [Id]                                    BIGINT         NULL,
    [Wellhead_Breakeven_Oil_Price_Category] NVARCHAR (MAX) NULL,
    [Wellhead_Breakeven_Oil_Price_Detail]   NVARCHAR (MAX) NULL,
    [TellurianUpdatedDate]                  DATETIME       DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]                  DATETIME       DEFAULT (getdate()) NULL
);

