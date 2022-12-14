CREATE TABLE [dbo].[LSE_CTRC_AUDIT] (
    [LSE_CTRC_AUDIT_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [SYSTEM_DATE]       DATETIME      NULL,
    [SYSTEM_TIME]       VARCHAR (7)   NULL,
    [SYSTEM_USER_ID]    VARCHAR (9)   NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LSE_CTRC_AUDIT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LSE_CTRC_AUDIT_u2_id_in]
    ON [dbo].[LSE_CTRC_AUDIT]([u2_id] ASC);

