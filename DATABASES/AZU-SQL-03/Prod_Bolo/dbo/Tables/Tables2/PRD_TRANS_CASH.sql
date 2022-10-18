﻿CREATE TABLE [dbo].[PRD_TRANS_CASH] (
    [PRD_TRANS_CASH_ID] VARCHAR (255)   NOT NULL,
    [u2_id]             VARCHAR (255)   NULL,
    [CASH_AMT]          NUMERIC (19, 2) NULL,
    [CASH_DATE]         DATETIME        NULL,
    [CASH_DOCUMENT]     VARCHAR (12)    NULL,
    [time_stamp]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PRD_TRANS_CASH_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRD_TRANS_CASH_u2_id_in]
    ON [dbo].[PRD_TRANS_CASH]([u2_id] ASC);

