CREATE TABLE [dbo].[AT_ASSET_DET] (
    [u2_id]                VARCHAR (255) NOT NULL,
    [ACCT]                 VARCHAR (10)  NULL,
    [ASSET]                VARCHAR (48)  NULL,
    [ASSET_ID]             VARCHAR (48)  NULL,
    [AT_ASSET_ID]          VARCHAR (48)  NULL,
    [AT_RETIREMENT_ID]     VARCHAR (10)  NULL,
    [COMPANY]              VARCHAR (3)   NULL,
    [ID]                   VARCHAR (126) NULL,
    [LOCATION_COST_CENTER] VARCHAR (10)  NULL,
    [ORIENTATION]          VARCHAR (10)  NULL,
    [PERSPECTIVE]          VARCHAR (5)   NULL,
    [RECALC_DEPR_ITD]      VARCHAR (6)   NULL,
    [SERIAL_NO]            VARCHAR (10)  NULL,
    [SOURCE_CURRENCY]      VARCHAR (6)   NULL,
    [TEMP_DDA_DATE]        DATETIME      NULL,
    [time_stamp]           DATETIME      NULL,
    [u2_checksum]          VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

