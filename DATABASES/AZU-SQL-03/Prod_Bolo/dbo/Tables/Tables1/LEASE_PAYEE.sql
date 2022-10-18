CREATE TABLE [dbo].[LEASE_PAYEE] (
    [u2_id]             VARCHAR (255)   NOT NULL,
    [DEPOSITORY]        VARCHAR (6)     NULL,
    [LEASE_ID]          VARCHAR (10)    NULL,
    [NON_NULL_FLAG]     VARCHAR (4)     NULL,
    [OVERRIDE_BANK_FEE] NUMERIC (19, 2) NULL,
    [PAYEE]             VARCHAR (7)     NULL,
    [time_stamp]        DATETIME        NULL,
    [u2_checksum]       VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

