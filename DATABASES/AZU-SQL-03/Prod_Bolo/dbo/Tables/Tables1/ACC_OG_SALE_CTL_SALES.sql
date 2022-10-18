﻿CREATE TABLE [dbo].[ACC_OG_SALE_CTL_SALES] (
    [ACC_OG_SALE_CTL_SALES_ID] VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [PENDING_SALES]            VARCHAR (8)   NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([ACC_OG_SALE_CTL_SALES_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ACC_OG_SALE_CTL_SALES_u2_id_in]
    ON [dbo].[ACC_OG_SALE_CTL_SALES]([u2_id] ASC);

