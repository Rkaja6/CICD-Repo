CREATE TABLE [dbo].[RV_OWNER_DET] (
    [subValueId]             VARCHAR (255)   NOT NULL,
    [RV_OWNER_PAY_BAL_CO_ID] VARCHAR (255)   NULL,
    [AP_PAY_BALS]            NUMERIC (19, 2) NULL,
    [ESCROW_PAY_BALS]        NUMERIC (19, 2) NULL,
    [LS_PAY_BALS]            NUMERIC (19, 2) NULL,
    [MP_PAY_BALS]            NUMERIC (19, 2) NULL,
    [MS_PAY_BALS]            NUMERIC (19, 2) NULL,
    [PAY_BAL_DATES]          DATETIME        NULL,
    [time_stamp]             DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RV_OWNER__RV_OWNER__37157]
    ON [dbo].[RV_OWNER_DET]([RV_OWNER_PAY_BAL_CO_ID] ASC);

