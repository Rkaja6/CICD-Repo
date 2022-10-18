﻿CREATE TABLE [dbo].[LD_SYS_AUDIT] (
    [LD_SYS_AUDIT_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [SYSTEM_DATE]     DATETIME      NULL,
    [SYSTEM_TIME]     VARCHAR (8)   NULL,
    [SYSTEM_USER_ID]  VARCHAR (5)   NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LD_SYS_AUDIT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LD_SYS_AUDIT_u2_id_in]
    ON [dbo].[LD_SYS_AUDIT]([u2_id] ASC);

