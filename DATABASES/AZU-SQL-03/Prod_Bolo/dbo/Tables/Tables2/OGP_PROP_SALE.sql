CREATE TABLE [dbo].[OGP_PROP_SALE] (
    [OGP_PROP_SALE_ID]        VARCHAR (255)   NOT NULL,
    [u2_id]                   VARCHAR (255)   NULL,
    [SALE_AMTS]               NUMERIC (19, 2) NULL,
    [SALE_CONTRACTS]          VARCHAR (20)    NULL,
    [SALE_CONTRACT_EFF_DATES] DATETIME        NULL,
    [SALE_DATES]              DATETIME        NULL,
    [time_stamp]              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([OGP_PROP_SALE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_PROP_SALE_u2_id_in]
    ON [dbo].[OGP_PROP_SALE]([u2_id] ASC);

