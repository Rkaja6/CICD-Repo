﻿CREATE TABLE [dbo].[CUST_X_STR] (
    [CUST_X_STR_ID] VARCHAR (255) NOT NULL,
    [u2_id]         VARCHAR (255) NULL,
    [XREF_STRING]   VARCHAR (24)  NULL,
    [time_stamp]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CUST_X_STR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CUST_X_STR_u2_id_in]
    ON [dbo].[CUST_X_STR]([u2_id] ASC);
