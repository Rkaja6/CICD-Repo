CREATE TABLE [dbo].[ACC_METHOD] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [ACCRUAL_MOS]    VARCHAR (7)   NULL,
    [BASIS_MOS]      VARCHAR (6)   NULL,
    [DEFAULT_VALUES] VARCHAR (7)   NULL,
    [DESCRIPTION]    VARCHAR (25)  NULL,
    [MANUAL_FLAG]    VARCHAR (6)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

