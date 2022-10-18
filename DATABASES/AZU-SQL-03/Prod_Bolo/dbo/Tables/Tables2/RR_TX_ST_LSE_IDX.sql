CREATE TABLE [dbo].[RR_TX_ST_LSE_IDX] (
    [subValueId]             VARCHAR (255)   NOT NULL,
    [RR_TX_ST_LSE_ID]        VARCHAR (255)   NULL,
    [DELV_CD]                VARCHAR (4)     NULL,
    [LSEUSE_DEDUCT_PERCENTS] NUMERIC (19, 6) NULL,
    [LSE_PART_DEC]           NUMERIC (19, 8) NULL,
    [RV_PRD_CAT]             VARCHAR (3)     NULL,
    [STATE_LEASE_INDEX]      VARCHAR (20)    NULL,
    [STATE_PRD]              VARCHAR (4)     NULL,
    [TAX_DUE]                VARCHAR (3)     NULL,
    [WELL_TYPE]              VARCHAR (4)     NULL,
    [time_stamp]             DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_TX_ST__RR_TX_ST__43438]
    ON [dbo].[RR_TX_ST_LSE_IDX]([RR_TX_ST_LSE_ID] ASC);

