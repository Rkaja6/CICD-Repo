CREATE TABLE [dbo].[AP_INV_TRANS] (
    [AP_INV_TRANS_ID] VARCHAR (255)   NOT NULL,
    [u2_id]           VARCHAR (255)   NULL,
    [ADJ_AMTS]        NUMERIC (19, 2) NULL,
    [ADJ_DATES]       DATETIME        NULL,
    [ADJ_DOCS]        VARCHAR (24)    NULL,
    [ADJ_TYPES]       VARCHAR (5)     NULL,
    [INT_ADJ_AMTS]    NUMERIC (19, 2) NULL,
    [TRANS_INDEX]     VARCHAR (9)     NULL,
    [time_stamp]      DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([AP_INV_TRANS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AP_INV_TRANS_u2_id_in]
    ON [dbo].[AP_INV_TRANS]([u2_id] ASC);

