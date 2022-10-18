CREATE TABLE [dbo].[DIV_BUR] (
    [subValueId]              VARCHAR (255)   NOT NULL,
    [DIV_BI_ASSOC_ID]         VARCHAR (255)   NULL,
    [BURDENS]                 NUMERIC (19, 8) NULL,
    [BUR_EFF_DATES]           DATETIME        NULL,
    [BUR_EFF_SESSIONS]        VARCHAR (4)     NULL,
    [BUR_EXP_DATES]           DATETIME        NULL,
    [BUR_EXP_SESSIONS]        VARCHAR (4)     NULL,
    [BUR_FORMULAS]            VARCHAR (8)     NULL,
    [BUR_INTEREST_TYPES]      VARCHAR (4)     NULL,
    [BUR_LEASES]              VARCHAR (16)    NULL,
    [BUR_OWNERS]              VARCHAR (10)    NULL,
    [BUR_PAY_CODES]           VARCHAR (4)     NULL,
    [ORIG_BUR_INTEREST_TYPES] VARCHAR (4)     NULL,
    [time_stamp]              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DIV_BUR_DIV_BI_ASSOC_ID_in]
    ON [dbo].[DIV_BUR]([DIV_BI_ASSOC_ID] ASC);

