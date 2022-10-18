CREATE TABLE [dbo].[DIV_RI] (
    [DIV_RI_ID]         VARCHAR (255)   NOT NULL,
    [u2_id]             VARCHAR (255)   NULL,
    [RI_EFF_DATES]      DATETIME        NULL,
    [RI_EFF_SESSIONS]   VARCHAR (7)     NULL,
    [RI_EXP_DATES]      DATETIME        NULL,
    [RI_EXP_SESSIONS]   VARCHAR (7)     NULL,
    [RI_FORMULAS]       VARCHAR (8)     NULL,
    [RI_INTEREST_TYPES] VARCHAR (3)     NULL,
    [RI_LEASES]         VARCHAR (16)    NULL,
    [RI_OWNERS]         VARCHAR (10)    NULL,
    [RI_PAY_CODES]      VARCHAR (2)     NULL,
    [ROYALTIES]         NUMERIC (19, 8) NULL,
    [time_stamp]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([DIV_RI_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DIV_RI_u2_id_in]
    ON [dbo].[DIV_RI]([u2_id] ASC);

