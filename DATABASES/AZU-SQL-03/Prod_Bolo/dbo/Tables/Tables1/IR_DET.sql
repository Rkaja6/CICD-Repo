CREATE TABLE [dbo].[IR_DET] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [ACCT]        VARCHAR (12)  NULL,
    [CC]          VARCHAR (10)  NULL,
    [COST_CENTER] VARCHAR (10)  NULL,
    [CURRENCY]    VARCHAR (10)  NULL,
    [DESCRIPTION] VARCHAR (4)   NULL,
    [INVESTOR]    VARCHAR (3)   NULL,
    [OWNER]       VARCHAR (3)   NULL,
    [PROGRAM_ID]  VARCHAR (8)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

