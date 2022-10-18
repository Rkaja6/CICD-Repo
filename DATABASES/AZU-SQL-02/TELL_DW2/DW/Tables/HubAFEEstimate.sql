CREATE TABLE [DW].[HubAFEEstimate] (
    [AFEEstimateHashKey] CHAR (32)     NOT NULL,
    [RecordSource]       VARCHAR (50)  NOT NULL,
    [LoadDate]           DATETIME2 (7) CONSTRAINT [DF_HubAFEEst_LoadDate] DEFAULT (getdate()) NOT NULL,
    [Estimate_idrec]     VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_HubAFEEstimate] PRIMARY KEY NONCLUSTERED ([AFEEstimateHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_HubAFEEstimate_idrec] UNIQUE NONCLUSTERED ([Estimate_idrec] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

