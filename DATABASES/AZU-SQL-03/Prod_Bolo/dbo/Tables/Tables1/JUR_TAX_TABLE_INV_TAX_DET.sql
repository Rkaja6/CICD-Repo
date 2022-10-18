CREATE TABLE [dbo].[JUR_TAX_TABLE_INV_TAX_DET] (
    [subValueId]               VARCHAR (255)   NOT NULL,
    [JUR_TAX_TABLE_INV_TAX_ID] VARCHAR (255)   NULL,
    [HOLD_ACCTS]               VARCHAR (10)    NULL,
    [HOLD_FLAGS]               VARCHAR (5)     NULL,
    [INV_MAXS]                 NUMERIC (19, 2) NULL,
    [INV_MINS]                 NUMERIC (19, 2) NULL,
    [TAX_ACCTS]                VARCHAR (9)     NULL,
    [TAX_EFF_DATES]            DATETIME        NULL,
    [TAX_RATES]                NUMERIC (19, 8) NULL,
    [time_stamp]               DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [JUR_TAX_T_JUR_TAX_T_28584]
    ON [dbo].[JUR_TAX_TABLE_INV_TAX_DET]([JUR_TAX_TABLE_INV_TAX_ID] ASC);

