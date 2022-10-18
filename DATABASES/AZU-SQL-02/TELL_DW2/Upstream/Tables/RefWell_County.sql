CREATE TABLE [Upstream].[RefWell_County] (
    [County]       VARCHAR (60)  NOT NULL,
    [LoadDate]     DATETIME2 (7) CONSTRAINT [DF__RefWell_C__LoadD__1EC48A19] DEFAULT (getdate()) NULL,
    [RecordSource] VARCHAR (50)  NULL,
    [New_County]   VARCHAR (60)  NULL,
    CONSTRAINT [PK_RefWell_County] PRIMARY KEY NONCLUSTERED ([County] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

