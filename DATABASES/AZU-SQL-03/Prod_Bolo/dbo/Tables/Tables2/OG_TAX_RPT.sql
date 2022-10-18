CREATE TABLE [dbo].[OG_TAX_RPT] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [COMPANY]        VARCHAR (3)     NULL,
    [CONTRACT]       VARCHAR (10)    NULL,
    [CO_CONFLICT]    VARCHAR (8)     NULL,
    [ORIG_OTR_ID]    VARCHAR (15)    NULL,
    [PROPERTY_NO]    VARCHAR (12)    NULL,
    [REFERENCE]      VARCHAR (9)     NULL,
    [SALE_DATE]      DATETIME        NULL,
    [STATE]          VARCHAR (5)     NULL,
    [STATE_PRD]      VARCHAR (5)     NULL,
    [STATE_PROPERTY] VARCHAR (20)    NULL,
    [a841_AMT]       NUMERIC (19, 2) NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

