CREATE TABLE [dbo].[Operator] (
    [Id]                     BIGINT         NULL,
    [Reported_Operator]      NVARCHAR (MAX) NULL,
    [Operator]               NVARCHAR (MAX) NULL,
    [Bloomberg_Ticker]       NVARCHAR (MAX) NULL,
    [Short_Ticker]           NVARCHAR (MAX) NULL,
    [Public_Private_Company] NVARCHAR (MAX) NULL,
    [TellurianUpdatedDate]   DATETIME       DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]   DATETIME       DEFAULT (getdate()) NULL
);

