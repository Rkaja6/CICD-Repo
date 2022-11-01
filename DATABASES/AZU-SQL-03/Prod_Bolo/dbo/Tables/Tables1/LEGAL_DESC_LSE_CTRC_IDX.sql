﻿CREATE TABLE [dbo].[LEGAL_DESC_LSE_CTRC_IDX] (
    [LEGAL_DESC_LSE_CTRC_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                      VARCHAR (255) NULL,
    [LSE_CTRC_TRACT_INDEX]       VARCHAR (14)  NULL,
    [time_stamp]                 DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LEGAL_DESC_LSE_CTRC_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LEGAL_DES_u2_id_61570]
    ON [dbo].[LEGAL_DESC_LSE_CTRC_IDX]([u2_id] ASC);
