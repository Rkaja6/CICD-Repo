CREATE TABLE [dbo].[PROD_WF_WORK_SYS_INFO] (
    [PROD_WF_WORK_SYS_INFO_ID] VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [PGM]                      VARCHAR (12)  NULL,
    [SYSTEM_DATE]              DATETIME      NULL,
    [SYSTEM_TIME]              VARCHAR (6)   NULL,
    [SYSTEM_USER_]             VARCHAR (6)   NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PROD_WF_WORK_SYS_INFO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_WF_WORK_SYS_INFO_u2_id_in]
    ON [dbo].[PROD_WF_WORK_SYS_INFO]([u2_id] ASC);

