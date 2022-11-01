﻿CREATE TABLE [dbo].[PROD_WF_FAC_EXP_DT] (
    [subValueId]      VARCHAR (255) NOT NULL,
    [PROD_WF_GATH_ID] VARCHAR (255) NULL,
    [FAC_EXP_DATES]   DATETIME      NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_WF_F_PROD_WF_G_39656]
    ON [dbo].[PROD_WF_FAC_EXP_DT]([PROD_WF_GATH_ID] ASC);
