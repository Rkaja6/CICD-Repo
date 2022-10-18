CREATE TABLE [dbo].[CostVendor] (
    [costvendor_id] INT            IDENTITY (1, 1) NOT NULL,
    [RowID]         BIGINT         NOT NULL,
    [VendorName]    NVARCHAR (MAX) NOT NULL,
    [modified_by]   BIGINT         NOT NULL,
    [modified_on]   DATETIME       NOT NULL,
    CONSTRAINT [PK_CostVendor] PRIMARY KEY CLUSTERED ([costvendor_id] ASC)
);

