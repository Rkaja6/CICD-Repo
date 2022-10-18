CREATE TABLE [dbo].[OGP_PROP_CHANGE_TP] (
    [OGP_PROP_CHANGE_TP_ID] VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [CHANGE_TYPE]           VARCHAR (6)   NULL,
    [DIV_FLAG]              VARCHAR (4)   NULL,
    [DIV_SIGN_DATE]         DATETIME      NULL,
    [DIV_SIGN_USER]         VARCHAR (6)   NULL,
    [SYSTEM_DATE]           DATETIME      NULL,
    [SYSTEM_USER_ID]        VARCHAR (6)   NULL,
    [TAX_FLAG]              VARCHAR (4)   NULL,
    [TAX_SIGN_DATE]         DATETIME      NULL,
    [TAX_SIGN_USER]         VARCHAR (6)   NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OGP_PROP_CHANGE_TP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_PROP_CHANGE_TP_u2_id_in]
    ON [dbo].[OGP_PROP_CHANGE_TP]([u2_id] ASC);

