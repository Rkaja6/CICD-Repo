CREATE TABLE [dbo].[MEAS_CTRC_LINK] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [EFF_DATE]    DATETIME      NULL,
    [EXP_DATE]    DATETIME      NULL,
    [MEAS_PT]     VARCHAR (8)   NULL,
    [PARENT_CTRC] VARCHAR (16)  NULL,
    [PRECEDENCE]  NUMERIC (9)   NULL,
    [UPI_FLAG]    VARCHAR (3)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

