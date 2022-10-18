CREATE TABLE [StageRystad].[Operator] (
    [Id]                     BIGINT         NOT NULL,
    [Reported_Operator]      NVARCHAR (MAX) NULL,
    [Operator]               NVARCHAR (MAX) NULL,
    [Bloomberg_Ticker]       NVARCHAR (MAX) NULL,
    [Short_Ticker]           NVARCHAR (MAX) NULL,
    [Public_Private_Company] NVARCHAR (MAX) NULL,
    [TellurianUpdatedDate]   DATETIME       NULL,
    [TellurianCreatedDate]   DATETIME       NULL,
    CONSTRAINT [PK_Operator] PRIMARY KEY CLUSTERED ([Id] ASC)
);

