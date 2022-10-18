CREATE TABLE [dbo].[JUR_TAX_TABLE_VAT] (
    [JUR_TAX_TABLE_VAT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                VARCHAR (255)   NULL,
    [VAT_EFF_DATES]        DATETIME        NULL,
    [VAT_RATES]            NUMERIC (19, 8) NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([JUR_TAX_TABLE_VAT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [JUR_TAX_TABLE_VAT_u2_id_in]
    ON [dbo].[JUR_TAX_TABLE_VAT]([u2_id] ASC);

