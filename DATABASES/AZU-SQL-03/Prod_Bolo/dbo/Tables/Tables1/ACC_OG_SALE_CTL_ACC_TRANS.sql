﻿CREATE TABLE [dbo].[ACC_OG_SALE_CTL_ACC_TRANS] (
    [subValueId]              VARCHAR (255) NOT NULL,
    [ACC_OG_SALE_CTL_IDX_ID]  VARCHAR (255) NULL,
    [ACC_OG_SALE_TRANS_INDEX] VARCHAR (11)  NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ACC_OG_SA_ACC_OG_SA_70917]
    ON [dbo].[ACC_OG_SALE_CTL_ACC_TRANS]([ACC_OG_SALE_CTL_IDX_ID] ASC);

