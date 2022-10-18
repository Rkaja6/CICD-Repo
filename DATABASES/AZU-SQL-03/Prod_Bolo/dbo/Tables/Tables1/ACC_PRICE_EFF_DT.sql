CREATE TABLE [dbo].[ACC_PRICE_EFF_DT] (
    [ACC_PRICE_EFF_DT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]               VARCHAR (255)   NULL,
    [EFF_DATES]           DATETIME        NULL,
    [PRICES]              NUMERIC (19, 5) NULL,
    [REF_DATES]           DATETIME        NULL,
    [time_stamp]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([ACC_PRICE_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ACC_PRICE_EFF_DT_u2_id_in]
    ON [dbo].[ACC_PRICE_EFF_DT]([u2_id] ASC);

