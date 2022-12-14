CREATE TABLE [dbo].[JUR_TAX_TABLE_INV_TAX] (
    [JUR_TAX_TABLE_INV_TAX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [TAX_CODES]                VARCHAR (9)   NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([JUR_TAX_TABLE_INV_TAX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [JUR_TAX_TABLE_INV_TAX_u2_id_in]
    ON [dbo].[JUR_TAX_TABLE_INV_TAX]([u2_id] ASC);

