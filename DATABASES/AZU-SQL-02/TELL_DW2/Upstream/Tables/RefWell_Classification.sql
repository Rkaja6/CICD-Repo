CREATE TABLE [Upstream].[RefWell_Classification] (
    [Classification]     VARCHAR (60)  NOT NULL,
    [LoadDate]           DATETIME2 (7) CONSTRAINT [DF__RefWell_C__LoadD__542C7691] DEFAULT (getdate()) NULL,
    [RecordSource]       VARCHAR (50)  NULL,
    [New_Classification] VARCHAR (60)  NULL,
    CONSTRAINT [PK_RefWell_Classification] PRIMARY KEY NONCLUSTERED ([Classification] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

