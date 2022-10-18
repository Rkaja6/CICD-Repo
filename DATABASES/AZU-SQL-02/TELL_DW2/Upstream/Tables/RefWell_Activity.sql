CREATE TABLE [Upstream].[RefWell_Activity] (
    [Activity]     VARCHAR (60)  NOT NULL,
    [LoadDate]     DATETIME2 (7) CONSTRAINT [DF__RefWell_A__LoadD__515009E6] DEFAULT (getdate()) NULL,
    [RecordSource] VARCHAR (50)  NULL,
    [New_Activity] VARCHAR (60)  NULL,
    CONSTRAINT [PK_RefWell_Activity] PRIMARY KEY NONCLUSTERED ([Activity] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

