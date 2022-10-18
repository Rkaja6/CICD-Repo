CREATE TABLE [dbo].[AV_PURCHASER] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [BILL_ADDRESS] VARCHAR (9)   NULL,
    [REMIT_TO]     VARCHAR (9)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

