CREATE TABLE [dbo].[DIV_WI] (
    [DIV_WI_ID]              VARCHAR (255)   NOT NULL,
    [u2_id]                  VARCHAR (255)   NULL,
    [ORIG_WI_INTEREST_TYPES] VARCHAR (4)     NULL,
    [WI_ASSOC_INDEX]         VARCHAR (5)     NULL,
    [WI_ASSOC_INDEX_MSV]     VARCHAR (5)     NULL,
    [WI_EFF_DATES]           DATETIME        NULL,
    [WI_EFF_SESSIONS]        VARCHAR (4)     NULL,
    [WI_EXP_DATES]           DATETIME        NULL,
    [WI_EXP_SESSIONS]        VARCHAR (4)     NULL,
    [WI_FORMULAS]            VARCHAR (9)     NULL,
    [WI_INTEREST_TYPES]      VARCHAR (4)     NULL,
    [WI_LEASES]              VARCHAR (16)    NULL,
    [WI_NRIS]                NUMERIC (19, 8) NULL,
    [WI_OWNERS]              VARCHAR (10)    NULL,
    [WI_OWNER_NAMES]         VARCHAR (30)    NULL,
    [WI_PAY_CODES]           VARCHAR (4)     NULL,
    [WORKING_INTERESTS]      NUMERIC (19, 8) NULL,
    [time_stamp]             DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([DIV_WI_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DIV_WI_u2_id_in]
    ON [dbo].[DIV_WI]([u2_id] ASC);

