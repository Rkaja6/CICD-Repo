CREATE TABLE [dbo].[MEAS_PT_VOL] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COST_CENTER] VARCHAR (10)  NULL,
    [MEAS_PT]     VARCHAR (10)  NULL,
    [PRODUCT]     VARCHAR (7)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

