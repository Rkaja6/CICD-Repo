CREATE TABLE [dbo].[OFP_PROP_GRP_PRC_IDX] (
    [OFP_PROP_GRP_PRC_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [EFF_DATE]                DATETIME      NULL,
    [EXP_DATE]                DATETIME      NULL,
    [PRICE_CTRC_INDEX]        VARCHAR (10)  NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OFP_PROP_GRP_PRC_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OFP_PROP_GRP_PRC_IDX_u2_id_in]
    ON [dbo].[OFP_PROP_GRP_PRC_IDX]([u2_id] ASC);

