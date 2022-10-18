﻿CREATE TABLE [dbo].[CN_SYS_EXP_AT_ACCT] (
    [CN_SYS_EXP_AT_ACCT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [EXP_ASSET_ACCT_CAT]    VARCHAR (5)   NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CN_SYS_EXP_AT_ACCT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CN_SYS_EXP_AT_ACCT_u2_id_in]
    ON [dbo].[CN_SYS_EXP_AT_ACCT]([u2_id] ASC);

