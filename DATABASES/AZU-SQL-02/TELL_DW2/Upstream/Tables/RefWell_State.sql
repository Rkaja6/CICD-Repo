CREATE TABLE [Upstream].[RefWell_State] (
    [State]         VARCHAR (60)  NOT NULL,
    [LoadDate]      DATETIME2 (7) CONSTRAINT [DF__RefWell_S__LoadD__1BE81D6E] DEFAULT (getdate()) NULL,
    [RecordSource]  VARCHAR (50)  NULL,
    [New_State]     VARCHAR (60)  NULL,
    [New_StateAbbr] VARCHAR (2)   NULL,
    CONSTRAINT [PK_RefWell_State] PRIMARY KEY NONCLUSTERED ([State] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

