﻿CREATE TABLE [dbo].[OWNER_BAL_SALE_DT] (
    [OWNER_BAL_SALE_DT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [SALE_DATES]           DATETIME      NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OWNER_BAL_SALE_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OWNER_BAL_SALE_DT_u2_id_in]
    ON [dbo].[OWNER_BAL_SALE_DT]([u2_id] ASC);
