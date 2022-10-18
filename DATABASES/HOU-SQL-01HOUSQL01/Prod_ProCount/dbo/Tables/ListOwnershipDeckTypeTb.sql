CREATE TABLE [dbo].[ListOwnershipDeckTypeTb] (
    [Value]           INT          NOT NULL,
    [ObjectType]      INT          NULL,
    [Description]     VARCHAR (80) NULL,
    [BillRevenueFlag] VARCHAR (10) NULL,
    [ActiveFlag]      INT          NULL,
    [AccountingID]    VARCHAR (30) NULL,
    CONSTRAINT [PK_ListOwnershipDeckTypeTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

