﻿CREATE TABLE [dbo].[BANK_ACCT_USG] (
    [BANK_ACCT_USG_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [USGE]             VARCHAR (5)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([BANK_ACCT_USG_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [BANK_ACCT_USG_u2_id_in]
    ON [dbo].[BANK_ACCT_USG]([u2_id] ASC);

