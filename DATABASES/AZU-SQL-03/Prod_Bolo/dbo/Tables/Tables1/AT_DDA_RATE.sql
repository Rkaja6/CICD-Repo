CREATE TABLE [dbo].[AT_DDA_RATE] (
    [u2_id]             VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]      DATETIME        NULL,
    [ADJ_OVERRIDE]      VARCHAR (12)    NULL,
    [ASSET]             VARCHAR (3)     NULL,
    [COMPANY]           VARCHAR (3)     NULL,
    [COST_CENTER]       VARCHAR (12)    NULL,
    [OVERRIDE_DDA_RATE] NUMERIC (19, 6) NULL,
    [PERSPECTIVE]       VARCHAR (5)     NULL,
    [SYSTEM_DATE]       DATETIME        NULL,
    [SYSTEM_TIME]       VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]    VARCHAR (6)     NULL,
    [UOP_DDA_CATEGORY]  VARCHAR (7)     NULL,
    [time_stamp]        DATETIME        NULL,
    [u2_checksum]       VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

