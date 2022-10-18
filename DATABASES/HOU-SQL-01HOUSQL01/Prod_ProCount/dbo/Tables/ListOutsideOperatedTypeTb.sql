CREATE TABLE [dbo].[ListOutsideOperatedTypeTb] (
    [Value]        INT           NOT NULL,
    [ObjectType]   INT           NULL,
    [Description]  VARCHAR (150) NULL,
    [ActiveFlag]   INT           NULL,
    [AccountingID] VARCHAR (30)  NULL,
    CONSTRAINT [PK_ListOutsideOperatedTypeTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

