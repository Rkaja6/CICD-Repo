﻿CREATE TABLE [dbo].[MMR_HIST_CTL_SALE_DT] (
    [MMR_HIST_CTL_SALE_DT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [SALES_MMYY]              VARCHAR (5)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([MMR_HIST_CTL_SALE_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MMR_HIST_CTL_SALE_DT_u2_id_in]
    ON [dbo].[MMR_HIST_CTL_SALE_DT]([u2_id] ASC);
