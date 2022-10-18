CREATE TABLE [ETL].[WellView_COA] (
    [AcctCode]        VARCHAR (8)   NOT NULL,
    [Major]           AS            (left([AcctCode],(3))),
    [Minor]           AS            (right([AcctCode],(3))),
    [AcctDescription] VARCHAR (100) NULL,
    [Group]           VARCHAR (100) NULL,
    CONSTRAINT [PK_COA] PRIMARY KEY CLUSTERED ([AcctCode] ASC)
);

