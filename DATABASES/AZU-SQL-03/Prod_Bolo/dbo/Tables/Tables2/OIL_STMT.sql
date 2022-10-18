CREATE TABLE [dbo].[OIL_STMT] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [PROD_PERIOD] DATETIME      NULL,
    [PURCHASER]   VARCHAR (9)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

