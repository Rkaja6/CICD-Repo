CREATE TABLE [dbo].[CN_COA_CLASSX] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CLASS]       VARCHAR (5)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

