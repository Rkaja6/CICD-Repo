CREATE TABLE [dbo].[AT_ASSET_DET_BALFWD] (
    [u2_id]                VARCHAR (255)   NOT NULL,
    [ACCT]                 VARCHAR (10)    NULL,
    [ACCTG_PERIOD]         DATETIME        NULL,
    [ACCUM_DDA]            NUMERIC (19, 2) NULL,
    [ADDITIONS]            NUMERIC (19, 2) NULL,
    [ASSET]                VARCHAR (3)     NULL,
    [AT_ASSET_ID]          VARCHAR (3)     NULL,
    [COMPANY]              VARCHAR (3)     NULL,
    [DDA_RETIREMENT]       NUMERIC (19, 2) NULL,
    [IN_SERVICE_PERIOD]    DATETIME        NULL,
    [LOCATION_COST_CENTER] VARCHAR (11)    NULL,
    [PERSPECTIVE]          VARCHAR (5)     NULL,
    [QTY1]                 NUMERIC (19, 2) NULL,
    [QTY2]                 NUMERIC (19, 2) NULL,
    [RETIREMENTS]          NUMERIC (19, 2) NULL,
    [SOURCE_CURRENCY]      VARCHAR (10)    NULL,
    [time_stamp]           DATETIME        NULL,
    [u2_checksum]          VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

