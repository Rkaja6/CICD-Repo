CREATE TABLE [Upstream].[RefWell_Status] (
    [Status]       VARCHAR (60)  NOT NULL,
    [LoadDate]     DATETIME2 (7) CONSTRAINT [DF__RefWell_S__LoadD__3F3159AB] DEFAULT (getdate()) NULL,
    [RecordSource] VARCHAR (50)  NULL,
    [New_Status]   VARCHAR (60)  NULL,
    CONSTRAINT [PK_RefWell_Status] PRIMARY KEY NONCLUSTERED ([Status] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

