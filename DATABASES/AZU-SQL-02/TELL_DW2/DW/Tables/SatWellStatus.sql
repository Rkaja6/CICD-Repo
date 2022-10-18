CREATE TABLE [DW].[SatWellStatus] (
    [WellHashKey]    CHAR (32)     NOT NULL,
    [RecordSource]   VARCHAR (50)  NOT NULL,
    [LoadDate]       DATETIME2 (7) CONSTRAINT [DF__SatWellSt__LoadD__44EA3301] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]    DATETIME2 (7) NULL,
    [Status]         VARCHAR (60)  NULL,
    [Activity]       VARCHAR (60)  NULL,
    [Classification] VARCHAR (60)  NULL,
    CONSTRAINT [PK_SatWellStatus] PRIMARY KEY NONCLUSTERED ([WellHashKey] ASC, [RecordSource] ASC, [LoadDate] ASC)
);


GO
CREATE NONCLUSTERED INDEX [nci_wi_SatWellStatus_8AF2BA2C4A36047528566AD02AEE65D7]
    ON [DW].[SatWellStatus]([RecordSource] ASC, [LoadEndDate] ASC)
    INCLUDE([LoadDate], [WellHashKey]);

