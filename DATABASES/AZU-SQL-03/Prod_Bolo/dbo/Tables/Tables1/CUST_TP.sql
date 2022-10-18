﻿CREATE TABLE [dbo].[CUST_TP] (
    [CUST_TP_ID]     VARCHAR (255) NOT NULL,
    [u2_id]          VARCHAR (255) NULL,
    [CUSTOMER_TYPES] VARCHAR (8)   NULL,
    [time_stamp]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CUST_TP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CUST_TP_u2_id_in]
    ON [dbo].[CUST_TP]([u2_id] ASC);

