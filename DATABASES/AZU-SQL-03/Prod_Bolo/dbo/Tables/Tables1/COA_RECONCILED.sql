﻿CREATE TABLE [dbo].[COA_RECONCILED] (
    [COA_RECONCILED_ID]        VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [RECONCILED_ACCTG_PERIODS] VARCHAR (10)  NULL,
    [RECONCILED_DATE_TIMES]    VARCHAR (11)  NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([COA_RECONCILED_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [COA_RECONCILED_u2_id_in]
    ON [dbo].[COA_RECONCILED]([u2_id] ASC);
