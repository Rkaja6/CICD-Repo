﻿CREATE TABLE [dbo].[PRD_EQUIP_ALLOC_AUDIT] (
    [PRD_EQUIP_ALLOC_AUDIT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [SYSTEM_DATE]              DATETIME      NULL,
    [SYSTEM_TIME]              VARCHAR (8)   NULL,
    [SYSTEM_USER_ID]           VARCHAR (10)  NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRD_EQUIP_ALLOC_AUDIT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRD_EQUIP_ALLOC_AUDIT_u2_id_in]
    ON [dbo].[PRD_EQUIP_ALLOC_AUDIT]([u2_id] ASC);

