CREATE TABLE [dbo].[PRICE_CTRC_PROPERTY_GROUP_DESC] (
    [PRICE_CTRC_PROPERTY_GROUP_DESC_ID] VARCHAR (255) NOT NULL,
    [u2_id]                             VARCHAR (255) NULL,
    [PROPERTY_GROUP_DESC]               VARCHAR (30)  NULL,
    [time_stamp]                        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRICE_CTRC_PROPERTY_GROUP_DESC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRICE_CTR_u2_id_29719]
    ON [dbo].[PRICE_CTRC_PROPERTY_GROUP_DESC]([u2_id] ASC);

