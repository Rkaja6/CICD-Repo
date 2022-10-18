﻿CREATE TABLE [dbo].[LD_SYS_ACCT] (
    [LD_SYS_ACCT_ID] VARCHAR (255) NOT NULL,
    [u2_id]          VARCHAR (255) NULL,
    [ACCTS]          VARCHAR (10)  NULL,
    [time_stamp]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LD_SYS_ACCT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LD_SYS_ACCT_u2_id_in]
    ON [dbo].[LD_SYS_ACCT]([u2_id] ASC);

