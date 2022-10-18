﻿CREATE TABLE [dbo].[OG_SALE_OG_SALE_DET_INDEX] (
    [OG_SALE_OG_SALE_DET_INDEX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                        VARCHAR (255) NULL,
    [OG_SALE_DET_INDEX]            VARCHAR (11)  NULL,
    [time_stamp]                   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OG_SALE_OG_SALE_DET_INDEX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_SALE_O_u2_id_5055]
    ON [dbo].[OG_SALE_OG_SALE_DET_INDEX]([u2_id] ASC);

