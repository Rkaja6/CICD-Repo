CREATE TABLE [DW].[SatCostCenter] (
    [RecordSource]        VARCHAR (50)   NOT NULL,
    [LoadDate]            DATETIME2 (7)  CONSTRAINT [DF_SatCC_LoadDate] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]         DATETIME2 (7)  NULL,
    [CostCenterName]      VARCHAR (482)  NULL,
    [CostCenterNumber]    VARCHAR (21)   NULL,
    [CostCenterType]      VARCHAR (4)    NULL,
    [INPUT_DATE]          DATETIME       NULL,
    [INPUT_USER]          VARCHAR (5)    NULL,
    [TERMINATION_DATE]    DATETIME       NULL,
    [TERMINATION_REMARKS] VARCHAR (221)  NULL,
    [TERMINATION_TYPE]    VARCHAR (4)    NULL,
    [LAST_STATUS]         VARCHAR (5)    NULL,
    [MANAGER]             VARCHAR (12)   NULL,
    [CC_API_Number]       VARCHAR (18)   NULL,
    [COUNTY]              VARCHAR (30)   NULL,
    [DESCRIPTION]         VARCHAR (3904) NULL,
    [FIELD]               VARCHAR (34)   NULL,
    [STATE]               VARCHAR (2)    NULL,
    [CostCenterHashKey]   BINARY (32)    NOT NULL,
    CONSTRAINT [PK_SatCostCenter] PRIMARY KEY NONCLUSTERED ([CostCenterHashKey] ASC, [RecordSource] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

