CREATE TABLE [Upstream].[RefWell_PlayByStateCounty] (
    [State]        VARCHAR (60)  NOT NULL,
    [County]       VARCHAR (60)  NOT NULL,
    [LoadDate]     DATETIME2 (7) CONSTRAINT [DF__RefWell_P__LoadD__7E22B05D] DEFAULT (getdate()) NULL,
    [RecordSource] VARCHAR (50)  NULL,
    [New_Play]     VARCHAR (60)  NULL,
    [EIA_Play]     VARCHAR (60)  NULL,
    CONSTRAINT [PK_RefWell_PlayByStateCounty] PRIMARY KEY NONCLUSTERED ([State] ASC, [County] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

