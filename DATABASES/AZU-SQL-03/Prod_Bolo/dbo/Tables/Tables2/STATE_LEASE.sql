CREATE TABLE [dbo].[STATE_LEASE] (
    [u2_id]             VARCHAR (255)   NOT NULL,
    [FIELD]             VARCHAR (4)     NULL,
    [LEASE_TYPE]        VARCHAR (5)     NULL,
    [NAME]              VARCHAR (30)    NULL,
    [PAYOUT_ACTUAL_AMT] NUMERIC (19, 2) NULL,
    [PAYOUT_TERM]       VARCHAR (6)     NULL,
    [PAYOUT_TOTAL_AMT]  NUMERIC (19, 2) NULL,
    [PLANT]             VARCHAR (5)     NULL,
    [WELL_NO]           VARCHAR (7)     NULL,
    [WELL_SERIAL_NO]    VARCHAR (6)     NULL,
    [WELL_TYPE]         VARCHAR (5)     NULL,
    [time_stamp]        DATETIME        NULL,
    [u2_checksum]       VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

