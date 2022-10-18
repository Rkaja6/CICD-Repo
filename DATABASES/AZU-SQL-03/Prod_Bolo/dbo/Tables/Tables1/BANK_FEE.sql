CREATE TABLE [dbo].[BANK_FEE] (
    [u2_id]       VARCHAR (255)   NOT NULL,
    [BANK_FEE]    NUMERIC (19, 2) NULL,
    [time_stamp]  DATETIME        NULL,
    [u2_checksum] VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

