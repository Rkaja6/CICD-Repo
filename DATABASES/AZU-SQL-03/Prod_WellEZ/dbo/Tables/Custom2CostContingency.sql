﻿CREATE TABLE [dbo].[Custom2CostContingency] (
    [custom2costcontingency_id] INT             IDENTITY (1, 1) NOT NULL,
    [well_id]                   BIGINT          NULL,
    [job_number]                BIGINT          NOT NULL,
    [reportTypeId]              BIGINT          NOT NULL,
    [report_Date]               DATETIME        NOT NULL,
    [ExpenseType]               INT             NULL,
    [OverrideCost]              BIT             NULL,
    [ContingencyValue]          INT             NULL,
    [Cost]                      DECIMAL (19, 9) NULL,
    [CostCum]                   DECIMAL (19, 9) NULL,
    [AllocatedToJob]            DECIMAL (19, 9) NULL,
    [Remarks]                   NVARCHAR (MAX)  NULL,
    [RowID]                     BIGINT          NOT NULL,
    [location_id]               INT             NULL,
    CONSTRAINT [PK_Custom2CostContingency] PRIMARY KEY CLUSTERED ([custom2costcontingency_id] ASC)
);

