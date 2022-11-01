﻿CREATE TABLE [dbo].[OG_SALE_TRANS_INDEX] (
    [OG_SALE_TRANS_INDEX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [TRANS_INDEX]            VARCHAR (9)   NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OG_SALE_TRANS_INDEX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_SALE_TRANS_INDEX_u2_id_in]
    ON [dbo].[OG_SALE_TRANS_INDEX]([u2_id] ASC);
