﻿CREATE TABLE [dbo].[CUST_JBCC] (
    [CUST_JBCC_ID]   VARCHAR (255) NOT NULL,
    [u2_id]          VARCHAR (255) NULL,
    [DFLT_NET_JBCCS] VARCHAR (4)   NULL,
    [time_stamp]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CUST_JBCC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CUST_JBCC_u2_id_in]
    ON [dbo].[CUST_JBCC]([u2_id] ASC);

