CREATE TABLE [dbo].[CostAllocationItem] (
    [costallocationitem_id] INT             IDENTITY (1, 1) NOT NULL,
    [RowID]                 BIGINT          NOT NULL,
    [location_id]           INT             NOT NULL,
    [job_number]            BIGINT          NOT NULL,
    [reportTypeId]          BIGINT          NOT NULL,
    [LineNumber]            BIGINT          NULL,
    [LocWellId]             INT             NULL,
    [LocWellJobId]          INT             NULL,
    [AllocPercent]          DECIMAL (19, 9) NULL,
    CONSTRAINT [PK_CostAllocationItem] PRIMARY KEY CLUSTERED ([costallocationitem_id] ASC)
);

