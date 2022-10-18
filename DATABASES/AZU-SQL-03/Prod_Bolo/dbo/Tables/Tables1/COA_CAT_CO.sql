CREATE TABLE [dbo].[COA_CAT_CO] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [REVALUE_ACCT] VARCHAR (11)  NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

