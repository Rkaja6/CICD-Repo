CREATE TABLE [dbo].[DIV_OWNER] (
    [subValueId]              VARCHAR (255)   NOT NULL,
    [DIV_CPT_ID]              VARCHAR (255)   NULL,
    [CPT_EFF_DATES]           DATETIME        NULL,
    [CPT_EFF_SESSIONS]        VARCHAR (4)     NULL,
    [CPT_EXEMPT_TYPES]        VARCHAR (6)     NULL,
    [CPT_EXP_DATES]           DATETIME        NULL,
    [CPT_EXP_SESSIONS]        VARCHAR (4)     NULL,
    [CPT_INTERESTS]           NUMERIC (19, 8) NULL,
    [CPT_INTEREST_TYPES]      VARCHAR (4)     NULL,
    [CPT_OWNERS]              VARCHAR (10)    NULL,
    [ORIG_CPT_INTEREST_TYPES] VARCHAR (4)     NULL,
    [time_stamp]              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DIV_OWNER_DIV_CPT_ID_in]
    ON [dbo].[DIV_OWNER]([DIV_CPT_ID] ASC);

