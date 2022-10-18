CREATE TABLE [dbo].[PAY] (
    [u2_id]               VARCHAR (255) NOT NULL,
    [DESCRIPTION]         VARCHAR (47)  NULL,
    [GR_ACC_PAYABLE_ACCT] VARCHAR (10)  NULL,
    [GR_PAYABLE_ACCT]     VARCHAR (10)  NULL,
    [PAY_DISP]            VARCHAR (4)   NULL,
    [time_stamp]          DATETIME      NULL,
    [u2_checksum]         VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

