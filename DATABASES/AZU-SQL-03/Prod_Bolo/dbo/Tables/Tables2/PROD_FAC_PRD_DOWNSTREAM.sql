﻿CREATE TABLE [dbo].[PROD_FAC_PRD_DOWNSTREAM] (
    [PROD_FAC_PRD_DOWNSTREAM_ID] VARCHAR (255) NOT NULL,
    [u2_id]                      VARCHAR (255) NULL,
    [DOWNSTREAM_EFF_DATES]       DATETIME      NULL,
    [DOWNSTREAM_EXP_DATES]       DATETIME      NULL,
    [time_stamp]                 DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PROD_FAC_PRD_DOWNSTREAM_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_FAC__u2_id_24984]
    ON [dbo].[PROD_FAC_PRD_DOWNSTREAM]([u2_id] ASC);

