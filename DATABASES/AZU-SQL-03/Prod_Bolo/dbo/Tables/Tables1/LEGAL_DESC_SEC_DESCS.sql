﻿CREATE TABLE [dbo].[LEGAL_DESC_SEC_DESCS] (
    [subValueId]         VARCHAR (255)  NOT NULL,
    [LEGAL_DESC_RECT_ID] VARCHAR (255)  NULL,
    [SEC_DESCS]          VARCHAR (7975) NULL,
    [time_stamp]         DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LEGAL_DES_LEGAL_DES_50331]
    ON [dbo].[LEGAL_DESC_SEC_DESCS]([LEGAL_DESC_RECT_ID] ASC);

