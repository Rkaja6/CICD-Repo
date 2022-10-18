CREATE TABLE [DW].[SatProduction] (
    [WellHashKey]    BINARY (32)     NOT NULL,
    [RecordSource]   VARCHAR (50)    NOT NULL,
    [LoadDate]       DATETIME2 (7)   CONSTRAINT [DF__SatProduction__LoadDate] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]    DATETIME2 (7)   NULL,
    [ProductionDate] DATETIME2 (7)   NOT NULL,
    [Liquid]         DECIMAL (14, 4) NULL,
    [Gas]            DECIMAL (14, 4) NULL,
    [Water]          DECIMAL (14, 4) NULL,
    [WellCount]      INT             NULL,
    [DaysOn]         INT             NULL,
    CONSTRAINT [PK_SatProduction] PRIMARY KEY CLUSTERED ([RecordSource] ASC, [ProductionDate] ASC, [LoadDate] ASC, [WellHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);


GO
CREATE NONCLUSTERED INDEX [idx_SatProduction_LoadEndDate]
    ON [DW].[SatProduction]([LoadEndDate] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_SatProduction_WellHashKey_ProductionDate]
    ON [DW].[SatProduction]([WellHashKey] ASC, [ProductionDate] ASC);

