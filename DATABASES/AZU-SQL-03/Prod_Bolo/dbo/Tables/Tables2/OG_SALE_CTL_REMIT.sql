CREATE TABLE [dbo].[OG_SALE_CTL_REMIT] (
    [OG_SALE_CTL_REMIT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                VARCHAR (255)   NULL,
    [CHECK_AMTS]           NUMERIC (19, 2) NULL,
    [CHECK_NOS]            VARCHAR (12)    NULL,
    [ENTERED_AMTS]         NUMERIC (19, 2) NULL,
    [REMITTERS]            VARCHAR (9)     NULL,
    [REMIT_FMTS]           VARCHAR (11)    NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([OG_SALE_CTL_REMIT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_SALE_CTL_REMIT_u2_id_in]
    ON [dbo].[OG_SALE_CTL_REMIT]([u2_id] ASC);

