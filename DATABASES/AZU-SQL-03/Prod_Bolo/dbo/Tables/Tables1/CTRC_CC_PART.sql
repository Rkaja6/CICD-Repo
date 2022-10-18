CREATE TABLE [dbo].[CTRC_CC_PART] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [CONTRACT]      VARCHAR (20)  NULL,
    [COST_CENTER]   VARCHAR (6)   NULL,
    [MEAS_PT]       VARCHAR (12)  NULL,
    [OVERRIDE_DECK] VARCHAR (8)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

