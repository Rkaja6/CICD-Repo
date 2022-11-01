﻿CREATE TABLE [dbo].[OWNER_SALE_ADJ] (
    [OWNER_SALE_ADJ_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [ADJ_PERIODS]       DATETIME      NULL,
    [RE_CHECK_IDS]      VARCHAR (18)  NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OWNER_SALE_ADJ_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OWNER_SALE_ADJ_u2_id_in]
    ON [dbo].[OWNER_SALE_ADJ]([u2_id] ASC);
