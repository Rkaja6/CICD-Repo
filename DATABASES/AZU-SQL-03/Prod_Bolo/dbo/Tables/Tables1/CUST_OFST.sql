﻿CREATE TABLE [dbo].[CUST_OFST] (
    [CUST_OFST_ID]     VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [OFFSET_CUSTOMERS] VARCHAR (9)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CUST_OFST_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CUST_OFST_u2_id_in]
    ON [dbo].[CUST_OFST]([u2_id] ASC);

