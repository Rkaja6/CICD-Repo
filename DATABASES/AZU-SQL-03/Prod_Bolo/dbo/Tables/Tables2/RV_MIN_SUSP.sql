CREATE TABLE [dbo].[RV_MIN_SUSP] (
    [u2_id]       VARCHAR (255)   NOT NULL,
    [AMT]         NUMERIC (19, 2) NULL,
    [DESCRIPTION] VARCHAR (30)    NULL,
    [LAST_AMT]    NUMERIC (19, 2) NULL,
    [time_stamp]  DATETIME        NULL,
    [u2_checksum] VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

