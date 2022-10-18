﻿CREATE TABLE [dbo].[SUBSCRIPTION_CHECK] (
    [SUBSCRIPTION_CHECK_ID] VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [CHECK_AMTS]            VARCHAR (12)  NULL,
    [CHECK_DEPOSIT_DATES]   VARCHAR (10)  NULL,
    [CHECK_NOS]             VARCHAR (10)  NULL,
    [CHECK_REC_DATES]       VARCHAR (10)  NULL,
    [REMITTER]              VARCHAR (10)  NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([SUBSCRIPTION_CHECK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [SUBSCRIPTION_CHECK_u2_id_in]
    ON [dbo].[SUBSCRIPTION_CHECK]([u2_id] ASC);

