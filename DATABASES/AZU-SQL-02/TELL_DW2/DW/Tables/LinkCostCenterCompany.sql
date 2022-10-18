CREATE TABLE [DW].[LinkCostCenterCompany] (
    [CostCenterCompanyHashKey] CHAR (32)     NOT NULL,
    [CostCenterHashKey]        CHAR (32)     NOT NULL,
    [CompanyPartyHashKey]      CHAR (32)     NOT NULL,
    [RecordSource]             VARCHAR (50)  NOT NULL,
    [LoadDate]                 DATETIME2 (7) CONSTRAINT [DF_LinkCCCompany_LoadDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LinkCCCompany] PRIMARY KEY NONCLUSTERED ([CostCenterCompanyHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_LinkCCCompany] UNIQUE NONCLUSTERED ([CostCenterHashKey] ASC, [CompanyPartyHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

