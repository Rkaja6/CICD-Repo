CREATE TABLE [Upstream].[RefWell_PrimaryProduct] (
    [Primary_Product]     VARCHAR (12)  NOT NULL,
    [LoadDate]            DATETIME2 (7) CONSTRAINT [DF__RefWell_P__LoadD__190BB0C3] DEFAULT (getdate()) NULL,
    [RecordSource]        VARCHAR (50)  NULL,
    [New_Primary_Product] VARCHAR (50)  NULL,
    CONSTRAINT [PK_RefWell_PrimaryProduct] PRIMARY KEY NONCLUSTERED ([Primary_Product] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

