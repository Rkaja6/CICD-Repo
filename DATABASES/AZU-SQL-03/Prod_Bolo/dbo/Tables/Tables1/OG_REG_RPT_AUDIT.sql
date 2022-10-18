﻿CREATE TABLE [dbo].[OG_REG_RPT_AUDIT] (
    [OG_REG_RPT_AUDIT_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [PERIOD_AUDIT]        DATETIME      NULL,
    [STATUS_AUDIT]        VARCHAR (3)   NULL,
    [SYSTEM_DATE]         DATETIME      NULL,
    [SYSTEM_TIME]         VARCHAR (8)   NULL,
    [SYSTEM_USER_ID]      VARCHAR (8)   NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OG_REG_RPT_AUDIT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_REG_RPT_AUDIT_u2_id_in]
    ON [dbo].[OG_REG_RPT_AUDIT]([u2_id] ASC);

