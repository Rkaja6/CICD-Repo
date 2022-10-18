CREATE TABLE [DW].[SatAFEEstimates] (
    [AFEHashKey]         CHAR (32)       NOT NULL,
    [RecordSource]       VARCHAR (50)    NOT NULL,
    [AccountingPeriod]   DATETIME2 (7)   NOT NULL,
    [JobReportCostGenID] VARCHAR (32)    NOT NULL,
    [LoadDate]           DATETIME2 (7)   CONSTRAINT [DF__SatAFEEst__LoadD__035179CE] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]        DATETIME2 (7)   NULL,
    [Amount]             NUMERIC (19, 2) NULL,
    CONSTRAINT [PK_SatAFEEstimates] PRIMARY KEY NONCLUSTERED ([AFEHashKey] ASC, [RecordSource] ASC, [AccountingPeriod] ASC, [JobReportCostGenID] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

