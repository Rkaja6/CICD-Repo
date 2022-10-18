CREATE TABLE [CSV].[Operator] (
    [Id]                     VARCHAR (68)  NULL,
    [Reported Operator]      VARCHAR (148) NULL,
    [Operator]               VARCHAR (120) NULL,
    [Bloomberg Ticker]       VARCHAR (30)  NULL,
    [Short Ticker]           VARCHAR (30)  NULL,
    [Public Private Company] VARCHAR (30)  NULL,
    [TellurianUpdatedDate]   DATETIME      DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]   DATETIME      DEFAULT (getdate()) NULL
);

