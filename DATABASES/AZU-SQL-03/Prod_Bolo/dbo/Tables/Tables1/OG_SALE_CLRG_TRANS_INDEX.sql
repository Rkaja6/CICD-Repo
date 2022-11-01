﻿CREATE TABLE [dbo].[OG_SALE_CLRG_TRANS_INDEX] (
    [OG_SALE_CLRG_TRANS_INDEX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                       VARCHAR (255) NULL,
    [CLRG_TRANS_INDEX]            VARCHAR (8)   NULL,
    [time_stamp]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OG_SALE_CLRG_TRANS_INDEX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_SALE_C_u2_id_23654]
    ON [dbo].[OG_SALE_CLRG_TRANS_INDEX]([u2_id] ASC);
