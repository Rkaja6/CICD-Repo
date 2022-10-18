CREATE TABLE [dbo].[OGP_PROP_PURCH] (
    [OGP_PROP_PURCH_ID]        VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [PURCHASERS]               VARCHAR (9)   NULL,
    [PURCH_CONTRACTS]          VARCHAR (20)  NULL,
    [PURCH_CONTRACT_EFF_DATES] DATETIME      NULL,
    [PUR_EFF_DATES]            DATETIME      NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OGP_PROP_PURCH_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_PROP_PURCH_u2_id_in]
    ON [dbo].[OGP_PROP_PURCH]([u2_id] ASC);

