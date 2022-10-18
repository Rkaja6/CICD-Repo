CREATE TABLE [dbo].[WFETransportHelicopter] (
    [wfetransporthelicopter_id] INT            IDENTITY (1, 1) NOT NULL,
    [well_id]                   BIGINT         NULL,
    [report_Date]               DATETIME       NOT NULL,
    [line_number]               BIGINT         NOT NULL,
    [job_number]                BIGINT         NOT NULL,
    [TakeOffTime]               DATETIME       NULL,
    [reportTypeId]              BIGINT         NOT NULL,
    [Remark]                    NVARCHAR (MAX) NULL,
    [LendingTime]               DATETIME       NULL,
    [RowID]                     BIGINT         NOT NULL,
    CONSTRAINT [PK_WFETransportHelicopter] PRIMARY KEY CLUSTERED ([wfetransporthelicopter_id] ASC)
);

