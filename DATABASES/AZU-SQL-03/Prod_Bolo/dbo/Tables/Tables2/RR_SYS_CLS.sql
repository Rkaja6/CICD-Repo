CREATE TABLE [dbo].[RR_SYS_CLS] (
    [RR_SYS_CLS_ID]            VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [NM_DAVE_CLASS]            VARCHAR (4)   NULL,
    [NM_SPECIAL_TAX_RATE_CODE] VARCHAR (4)   NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RR_SYS_CLS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_SYS_CLS_u2_id_in]
    ON [dbo].[RR_SYS_CLS]([u2_id] ASC);

