﻿CREATE TABLE [dbo].[BANK_FEE_LMT] (
    [BANK_FEE_LMT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]           VARCHAR (255)   NULL,
    [BANK_FEES]       NUMERIC (19, 2) NULL,
    [UPPER_LIMITS]    NUMERIC (19, 2) NULL,
    [time_stamp]      DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([BANK_FEE_LMT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [BANK_FEE_LMT_u2_id_in]
    ON [dbo].[BANK_FEE_LMT]([u2_id] ASC);

