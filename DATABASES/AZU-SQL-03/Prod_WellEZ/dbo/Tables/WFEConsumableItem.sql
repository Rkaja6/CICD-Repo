CREATE TABLE [dbo].[WFEConsumableItem] (
    [wfeconsumableitem_id] INT             IDENTITY (1, 1) NOT NULL,
    [well_id]              BIGINT          NULL,
    [report_Date]          DATETIME        NOT NULL,
    [job_number]           BIGINT          NOT NULL,
    [reportTypeId]         BIGINT          NOT NULL,
    [Used]                 DECIMAL (19, 9) NULL,
    [Received]             DECIMAL (19, 9) NULL,
    [RowID]                BIGINT          NOT NULL,
    [location_id]          INT             NULL,
    [line_number]          BIGINT          NOT NULL,
    [Consumable_PickList]  NVARCHAR (MAX)  NULL,
    [UOMConsumable]        INT             NULL,
    CONSTRAINT [PK_WFEConsumableItem] PRIMARY KEY CLUSTERED ([wfeconsumableitem_id] ASC)
);

