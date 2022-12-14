CREATE TABLE [dbo].[OGP_PROP_RMK] (
    [OGP_PROP_RMK_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [REMARKS]         VARCHAR (30)  NULL,
    [REMARK_CODES]    VARCHAR (6)   NULL,
    [REMARK_DATES]    DATETIME      NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OGP_PROP_RMK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_PROP_RMK_u2_id_in]
    ON [dbo].[OGP_PROP_RMK]([u2_id] ASC);

