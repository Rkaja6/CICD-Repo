CREATE TABLE [dbo].[AT_DDA_DET] (
    [u2_id]                 VARCHAR (255)   NOT NULL,
    [ACCT]                  VARCHAR (10)    NULL,
    [ACCTG_PERIOD]          DATETIME        NULL,
    [ASSET]                 VARCHAR (3)     NULL,
    [AT_ASSET_DET_ID]       VARCHAR (20)    NULL,
    [AT_ASSET_ID]           VARCHAR (10)    NULL,
    [COMPANY]               VARCHAR (3)     NULL,
    [LOCATION_COST_CENTER]  VARCHAR (10)    NULL,
    [NOT_USED_34]           VARCHAR (8)     NULL,
    [PERSPECTIVE]           VARCHAR (5)     NULL,
    [RECALC_DEPR_ITD]       VARCHAR (6)     NULL,
    [SERIAL_NO]             VARCHAR (10)    NULL,
    [TEMP_FLAG]             VARCHAR (4)     NULL,
    [UOP]                   VARCHAR (126)   NULL,
    [UOP_ACCUM_DDA_ADJ_AMT] NUMERIC (19, 2) NULL,
    [VOUCHER]               VARCHAR (12)    NULL,
    [time_stamp]            DATETIME        NULL,
    [u2_checksum]           VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

