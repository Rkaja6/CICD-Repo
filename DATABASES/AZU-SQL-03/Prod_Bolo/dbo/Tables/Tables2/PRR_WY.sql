CREATE TABLE [dbo].[PRR_WY] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [LOT_OR_TRACT] VARCHAR (15)  NULL,
    [PERMIT_NO]    VARCHAR (8)   NULL,
    [QTR1]         VARCHAR (5)   NULL,
    [QTR2]         VARCHAR (5)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

