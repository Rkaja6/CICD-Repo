﻿CREATE TABLE [dbo].[OWNER_SALE_CURR] (
    [OWNER_SALE_CURR_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [CURR_PERIODS]       VARCHAR (10)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OWNER_SALE_CURR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OWNER_SALE_CURR_u2_id_in]
    ON [dbo].[OWNER_SALE_CURR]([u2_id] ASC);
