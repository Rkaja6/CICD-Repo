CREATE TABLE [dbo].[OFP_TARIFF_RATE] (
    [subValueId]           VARCHAR (255)   NOT NULL,
    [OFP_TARIFF_EFF_DT_ID] VARCHAR (255)   NULL,
    [BEG_RANGES]           NUMERIC (9, 1)  NULL,
    [END_RANGES]           NUMERIC (9, 1)  NULL,
    [RATES]                NUMERIC (19, 4) NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OFP_TARIF_OFP_TARIF_6433]
    ON [dbo].[OFP_TARIFF_RATE]([OFP_TARIFF_EFF_DT_ID] ASC);

