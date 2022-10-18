CREATE TABLE [dbo].[GAS_METER_STMT] (
    [u2_id]              VARCHAR (255)   NOT NULL,
    [DISP]               VARCHAR (11)    NULL,
    [ENTERED_BTU_FACTOR] NUMERIC (19, 4) NULL,
    [FACILITY]           VARCHAR (12)    NULL,
    [GATHERER]           VARCHAR (8)     NULL,
    [GATHERING_SYSTEM]   VARCHAR (9)     NULL,
    [MCF_VOLUME]         NUMERIC (19, 2) NULL,
    [METER]              VARCHAR (10)    NULL,
    [MMBTU_VOLUME]       NUMERIC (19, 2) NULL,
    [PRODUCT]            VARCHAR (3)     NULL,
    [PROD_PERIOD]        DATETIME        NULL,
    [SUB_SYSTEM]         VARCHAR (10)    NULL,
    [time_stamp]         DATETIME        NULL,
    [u2_checksum]        VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

