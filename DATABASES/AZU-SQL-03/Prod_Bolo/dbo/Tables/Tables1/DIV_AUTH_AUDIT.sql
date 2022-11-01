﻿CREATE TABLE [dbo].[DIV_AUTH_AUDIT] (
    [DIV_AUTH_AUDIT_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [SYSTEM_DATE]       DATETIME      NULL,
    [SYSTEM_TIME]       VARCHAR (5)   NULL,
    [SYSTEM_USER_ID]    VARCHAR (5)   NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([DIV_AUTH_AUDIT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DIV_AUTH_AUDIT_u2_id_in]
    ON [dbo].[DIV_AUTH_AUDIT]([u2_id] ASC);
