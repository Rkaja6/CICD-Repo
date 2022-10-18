CREATE TABLE [dbo].[CostAllocation] (
    [costallocation_id] INT            IDENTITY (1, 1) NOT NULL,
    [RowID]             BIGINT         NOT NULL,
    [location_id]       INT            NOT NULL,
    [job_number]        BIGINT         NOT NULL,
    [reportTypeId]      BIGINT         NOT NULL,
    [Comments]          NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_CostAllocation] PRIMARY KEY CLUSTERED ([costallocation_id] ASC)
);

