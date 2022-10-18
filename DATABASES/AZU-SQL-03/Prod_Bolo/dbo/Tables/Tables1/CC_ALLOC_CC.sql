CREATE TABLE [dbo].[CC_ALLOC_CC] (
    [CC_ALLOC_CC_ID]          VARCHAR (255)   NOT NULL,
    [u2_id]                   VARCHAR (255)   NULL,
    [ACCTS]                   VARCHAR (12)    NULL,
    [BYPASS_ALLOCATION_FLAGS] VARCHAR (6)     NULL,
    [COST_CENTERS]            VARCHAR (8)     NULL,
    [COST_CENTER_COMPANY]     VARCHAR (7)     NULL,
    [PERCENTS]                NUMERIC (19, 6) NULL,
    [WEIGHTS]                 NUMERIC (19, 2) NULL,
    [time_stamp]              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([CC_ALLOC_CC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_ALLOC_CC_u2_id_in]
    ON [dbo].[CC_ALLOC_CC]([u2_id] ASC);

