﻿CREATE TABLE [dbo].[RECEIPT_TYPE_IDX] (
    [RECEIPT_TYPE_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [BUS_RELATION_INDEX]  VARCHAR (12)  NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RECEIPT_TYPE_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RECEIPT_TYPE_IDX_u2_id_in]
    ON [dbo].[RECEIPT_TYPE_IDX]([u2_id] ASC);

