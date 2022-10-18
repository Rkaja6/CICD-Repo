﻿CREATE TABLE [dbo].[PROD_DAILY_EQ_DISP] (
    [PROD_DAILY_EQ_DISP_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                 VARCHAR (255)   NULL,
    [DISPS]                 VARCHAR (5)     NULL,
    [DISP_GROSS_VOLS]       NUMERIC (19, 2) NULL,
    [DISP_SOURCE_DOCS]      VARCHAR (6)     NULL,
    [DISP_VOLS]             NUMERIC (19, 2) NULL,
    [PRIMARY_DISP_FLAGS]    VARCHAR (4)     NULL,
    [PROD_FAC_PRD_ID]       VARCHAR (15)    NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PROD_DAILY_EQ_DISP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_DAILY_EQ_DISP_u2_id_in]
    ON [dbo].[PROD_DAILY_EQ_DISP]([u2_id] ASC);

