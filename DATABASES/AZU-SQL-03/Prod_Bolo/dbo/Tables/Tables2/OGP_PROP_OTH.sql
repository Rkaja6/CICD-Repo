CREATE TABLE [dbo].[OGP_PROP_OTH] (
    [OGP_PROP_OTH_ID]          VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [OTHER_CONTRACTS]          VARCHAR (20)  NULL,
    [OTHER_CONTRACT_EFF_DATES] DATETIME      NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OGP_PROP_OTH_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_PROP_OTH_u2_id_in]
    ON [dbo].[OGP_PROP_OTH]([u2_id] ASC);

