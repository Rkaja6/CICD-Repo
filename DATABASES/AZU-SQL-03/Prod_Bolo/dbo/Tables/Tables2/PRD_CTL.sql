CREATE TABLE [dbo].[PRD_CTL] (
    [u2_id]                       VARCHAR (255) NOT NULL,
    [BEGIN_PRD_ALLOC_DATE]        DATETIME      NULL,
    [DAILY_CONS_APP]              VARCHAR (9)   NULL,
    [DAILY_DATE_ORDER]            VARCHAR (7)   NULL,
    [DFLT_ORIENTATION]            VARCHAR (11)  NULL,
    [GAIN_LOSS_DISP]              VARCHAR (9)   NULL,
    [MINUTES_ENABLED]             VARCHAR (7)   NULL,
    [NET_OIL_INVENTORY_FLAG]      VARCHAR (5)   NULL,
    [PRODUCES_GAS_INJECTION_DISP] VARCHAR (9)   NULL,
    [PRODUCES_GAS_LIFT_DISP]      VARCHAR (9)   NULL,
    [ROLLING_DAYS]                VARCHAR (6)   NULL,
    [USE_OLD_ALLOC_ENG]           VARCHAR (9)   NULL,
    [time_stamp]                  DATETIME      NULL,
    [u2_checksum]                 VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

