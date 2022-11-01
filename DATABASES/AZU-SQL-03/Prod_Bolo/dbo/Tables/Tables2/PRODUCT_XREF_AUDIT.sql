﻿CREATE TABLE [dbo].[PRODUCT_XREF_AUDIT] (
    [PRODUCT_XREF_AUDIT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [SYSTEM_DATE]           DATETIME      NULL,
    [SYSTEM_TIME]           VARCHAR (8)   NULL,
    [SYSTEM_USER_ID]        VARCHAR (6)   NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRODUCT_XREF_AUDIT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRODUCT_XREF_AUDIT_u2_id_in]
    ON [dbo].[PRODUCT_XREF_AUDIT]([u2_id] ASC);
