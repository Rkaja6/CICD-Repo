CREATE TABLE [dbo].[MMS_SYS_PAYEE] (
    [MMS_SYS_PAYEE_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [DFLT_PMT_METH]    VARCHAR (4)   NULL,
    [PAYEE_NO]         VARCHAR (9)   NULL,
    [RIK_PAY_CODE]     VARCHAR (4)   NULL,
    [ROY_PAY_CODE]     VARCHAR (4)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([MMS_SYS_PAYEE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MMS_SYS_PAYEE_u2_id_in]
    ON [dbo].[MMS_SYS_PAYEE]([u2_id] ASC);

