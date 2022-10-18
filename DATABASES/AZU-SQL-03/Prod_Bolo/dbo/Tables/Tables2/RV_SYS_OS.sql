﻿CREATE TABLE [dbo].[RV_SYS_OS] (
    [RV_SYS_OS_ID]            VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [OWNER_SALE_ADJ_TAX_CPTS] VARCHAR (6)   NULL,
    [OWNER_SALE_SRC_TAX_CPTS] VARCHAR (5)   NULL,
    [OWNER_SALE_WI_TAX_CPTS]  VARCHAR (6)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RV_SYS_OS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RV_SYS_OS_u2_id_in]
    ON [dbo].[RV_SYS_OS]([u2_id] ASC);

