CREATE TABLE [dbo].[DR21W_TRANS] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [OGP_PROP_NO] VARCHAR (12)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

