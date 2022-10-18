﻿CREATE TABLE [dbo].[AV_SYS_PROD] (
    [AV_SYS_PROD_ID]   VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [DFLT_VOL1_UOM]    VARCHAR (4)   NULL,
    [DFLT_VOL2_UOM]    VARCHAR (4)   NULL,
    [PRODUCT_CATEGORY] VARCHAR (3)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AV_SYS_PROD_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AV_SYS_PROD_u2_id_in]
    ON [dbo].[AV_SYS_PROD]([u2_id] ASC);

