﻿CREATE TABLE [dbo].[CC_PROD_FAC_PRD] (
    [CC_PROD_FAC_PRD_ID]     VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [PROD_FAC_PRD_EFF_DATES] DATETIME      NULL,
    [PROD_FAC_PRD_EXP_DATES] DATETIME      NULL,
    [PROD_FAC_PRD_FLAGS]     VARCHAR (141) NULL,
    [PROD_FAC_PRD_INDEX]     VARCHAR (69)  NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CC_PROD_FAC_PRD_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_PROD_FAC_PRD_u2_id_in]
    ON [dbo].[CC_PROD_FAC_PRD]([u2_id] ASC);
