CREATE TABLE [DW].[SatProducingEntityUID] (
    [EntitySequence] INT           NOT NULL,
    [RecordSource]   VARCHAR (50)  NOT NULL,
    [LoadDate]       DATETIME2 (7) CONSTRAINT [DF__SatProduc__LoadD__7A8729A3] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]    DATETIME2 (7) NULL,
    [IHSEntity]      VARCHAR (40)  NULL,
    [DIEntityID]     INT           NULL,
    [WellHashKey]    BINARY (32)   NOT NULL,
    CONSTRAINT [PK_SatProducingEntityUID] PRIMARY KEY NONCLUSTERED ([WellHashKey] ASC, [EntitySequence] ASC, [RecordSource] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

