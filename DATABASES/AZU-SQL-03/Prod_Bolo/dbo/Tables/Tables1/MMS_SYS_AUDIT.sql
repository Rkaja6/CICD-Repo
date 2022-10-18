﻿CREATE TABLE [dbo].[MMS_SYS_AUDIT] (
    [MMS_SYS_AUDIT_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [SYSTEM_DATE]      DATETIME      NULL,
    [SYSTEM_TIME]      VARCHAR (10)  NULL,
    [SYSTEM_USER_ID]   VARCHAR (6)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([MMS_SYS_AUDIT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MMS_SYS_AUDIT_u2_id_in]
    ON [dbo].[MMS_SYS_AUDIT]([u2_id] ASC);

