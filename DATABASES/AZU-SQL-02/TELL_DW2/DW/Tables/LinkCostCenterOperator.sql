CREATE TABLE [DW].[LinkCostCenterOperator] (
    [CostCenterOperatorHashKey] CHAR (32)     NOT NULL,
    [CostCenterHashKey]         CHAR (32)     NOT NULL,
    [OperatorPartyHashKey]      CHAR (32)     NOT NULL,
    [RecordSource]              VARCHAR (50)  NOT NULL,
    [LoadDate]                  DATETIME2 (7) CONSTRAINT [DF_LinkCCOperator_LoadDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LinkCCOperator] PRIMARY KEY NONCLUSTERED ([CostCenterOperatorHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_LinkCCOperator] UNIQUE NONCLUSTERED ([CostCenterHashKey] ASC, [OperatorPartyHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

