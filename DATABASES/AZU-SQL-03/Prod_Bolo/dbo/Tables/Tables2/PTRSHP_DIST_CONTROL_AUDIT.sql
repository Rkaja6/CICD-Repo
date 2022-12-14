CREATE TABLE [dbo].[PTRSHP_DIST_CONTROL_AUDIT] (
    [PTRSHP_DIST_CONTROL_AUDIT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                        VARCHAR (255) NULL,
    [SYSTEM_DATE]                  DATETIME      NULL,
    [SYSTEM_TIME]                  VARCHAR (7)   NULL,
    [SYSTEM_USER_ID]               VARCHAR (6)   NULL,
    [time_stamp]                   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PTRSHP_DIST_CONTROL_AUDIT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTRSHP_DI_u2_id_3327]
    ON [dbo].[PTRSHP_DIST_CONTROL_AUDIT]([u2_id] ASC);

