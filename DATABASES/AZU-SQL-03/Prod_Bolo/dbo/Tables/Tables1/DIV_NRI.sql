CREATE TABLE [dbo].[DIV_NRI] (
    [DIV_NRI_ID]            VARCHAR (255)   NOT NULL,
    [u2_id]                 VARCHAR (255)   NULL,
    [NET_REVENUE_INTERESTS] NUMERIC (19, 8) NULL,
    [NRI_EFF_DATES]         DATETIME        NULL,
    [NRI_EFF_SESSIONS]      VARCHAR (4)     NULL,
    [NRI_EXP_DATES]         DATETIME        NULL,
    [NRI_EXP_SESSIONS]      VARCHAR (4)     NULL,
    [NRI_FORMULAS]          VARCHAR (21)    NULL,
    [NRI_INTEREST_TYPES]    VARCHAR (4)     NULL,
    [NRI_LEASES]            VARCHAR (16)    NULL,
    [NRI_OWNERS]            VARCHAR (10)    NULL,
    [NRI_PAY_CODES]         VARCHAR (4)     NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([DIV_NRI_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DIV_NRI_u2_id_in]
    ON [dbo].[DIV_NRI]([u2_id] ASC);

