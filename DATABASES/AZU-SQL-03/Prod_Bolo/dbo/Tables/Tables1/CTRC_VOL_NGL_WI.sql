﻿CREATE TABLE [dbo].[CTRC_VOL_NGL_WI] (
    [CTRC_VOL_NGL_WI_ID]   VARCHAR (255)   NOT NULL,
    [u2_id]                VARCHAR (255)   NULL,
    [ENTITLEMENT_INTEREST] NUMERIC (19, 8) NULL,
    [ENTITLEMENT_PROD_VOL] NUMERIC (19, 2) NULL,
    [ENTITLEMENT_VOL2]     NUMERIC (19, 3) NULL,
    [WI_INTEREST_TYPES]    NUMERIC (19, 8) NULL,
    [WI_OWNERS]            VARCHAR (9)     NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([CTRC_VOL_NGL_WI_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CTRC_VOL_NGL_WI_u2_id_in]
    ON [dbo].[CTRC_VOL_NGL_WI]([u2_id] ASC);
