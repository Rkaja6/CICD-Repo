CREATE TABLE [dbo].[MDECK_WI] (
    [MDECK_WI_ID]       VARCHAR (255)   NOT NULL,
    [u2_id]             VARCHAR (255)   NULL,
    [TOTAL_WI_ENTERED]  NUMERIC (19, 8) NULL,
    [WI_DISPLAY]        VARCHAR (11)    NULL,
    [WI_EFF_DATES]      DATETIME        NULL,
    [WI_EFF_SESSIONS]   VARCHAR (4)     NULL,
    [WI_EXP_DATES]      DATETIME        NULL,
    [WI_EXP_SESSIONS]   VARCHAR (4)     NULL,
    [WI_FORMULAS]       VARCHAR (15)    NULL,
    [WI_INTEREST_TYPES] VARCHAR (4)     NULL,
    [WI_LEASES]         VARCHAR (16)    NULL,
    [WI_OWNERS]         VARCHAR (10)    NULL,
    [WI_PAY_CODES]      VARCHAR (4)     NULL,
    [time_stamp]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([MDECK_WI_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MDECK_WI_u2_id_in]
    ON [dbo].[MDECK_WI]([u2_id] ASC);

