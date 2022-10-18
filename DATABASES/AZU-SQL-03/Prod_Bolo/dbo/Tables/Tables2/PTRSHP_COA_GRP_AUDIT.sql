﻿CREATE TABLE [dbo].[PTRSHP_COA_GRP_AUDIT] (
    [PTRSHP_COA_GRP_AUDIT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [SYSTEM_DATE]             DATETIME      NULL,
    [SYSTEM_TIME]             VARCHAR (8)   NULL,
    [SYSTEM_USER_ID]          VARCHAR (6)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PTRSHP_COA_GRP_AUDIT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTRSHP_COA_GRP_AUDIT_u2_id_in]
    ON [dbo].[PTRSHP_COA_GRP_AUDIT]([u2_id] ASC);

