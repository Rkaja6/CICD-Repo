﻿CREATE TABLE [dbo].[OG_SALE_CTL_OG_TRANS_IDX] (
    [subValueId]            VARCHAR (255) NOT NULL,
    [OG_SALE_CTL_OG_IDX_ID] VARCHAR (255) NULL,
    [OG_SALE_TRANS_INDEX]   VARCHAR (9)   NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_SALE_C_OG_SALE_C_11196]
    ON [dbo].[OG_SALE_CTL_OG_TRANS_IDX]([OG_SALE_CTL_OG_IDX_ID] ASC);

