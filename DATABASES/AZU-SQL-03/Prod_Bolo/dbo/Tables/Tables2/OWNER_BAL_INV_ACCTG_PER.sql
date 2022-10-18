﻿CREATE TABLE [dbo].[OWNER_BAL_INV_ACCTG_PER] (
    [OWNER_BAL_INV_ACCTG_PER_ID] VARCHAR (255) NOT NULL,
    [u2_id]                      VARCHAR (255) NULL,
    [INVERTED_ACCTG_PERIOD]      DATETIME      NULL,
    [time_stamp]                 DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OWNER_BAL_INV_ACCTG_PER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OWNER_BAL_u2_id_98938]
    ON [dbo].[OWNER_BAL_INV_ACCTG_PER]([u2_id] ASC);

