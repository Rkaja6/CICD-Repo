CREATE TABLE [dbo].[PDECK_INVTR] (
    [PDECK_INVTR_ID]        VARCHAR (255)   NOT NULL,
    [u2_id]                 VARCHAR (255)   NULL,
    [INVESTORS]             VARCHAR (10)    NULL,
    [INVESTOR_EFF_DATES]    DATETIME        NULL,
    [INVESTOR_EFF_SESSIONS] VARCHAR (7)     NULL,
    [INVESTOR_EXP_DATES]    DATETIME        NULL,
    [INVESTOR_EXP_SESSIONS] VARCHAR (7)     NULL,
    [INVESTOR_INTERESTS]    NUMERIC (19, 8) NULL,
    [INVESTOR_INT_TYPE]     VARCHAR (8)     NULL,
    [PAY_CODES]             VARCHAR (4)     NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PDECK_INVTR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PDECK_INVTR_u2_id_in]
    ON [dbo].[PDECK_INVTR]([u2_id] ASC);

