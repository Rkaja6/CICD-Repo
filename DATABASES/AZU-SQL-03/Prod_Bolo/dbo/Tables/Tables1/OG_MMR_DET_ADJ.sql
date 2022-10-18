﻿CREATE TABLE [dbo].[OG_MMR_DET_ADJ] (
    [OG_MMR_DET_ADJ_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [ADJ_PERIOD]        DATETIME      NULL,
    [ADJ_STATUS]        VARCHAR (3)   NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OG_MMR_DET_ADJ_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_MMR_DET_ADJ_u2_id_in]
    ON [dbo].[OG_MMR_DET_ADJ]([u2_id] ASC);

