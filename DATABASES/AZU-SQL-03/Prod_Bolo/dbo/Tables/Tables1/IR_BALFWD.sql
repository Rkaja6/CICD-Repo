CREATE TABLE [dbo].[IR_BALFWD] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [ACCT]        VARCHAR (11)  NULL,
    [COST_CENTER] VARCHAR (8)   NULL,
    [CURRENCY]    VARCHAR (8)   NULL,
    [INVESTOR]    VARCHAR (8)   NULL,
    [IR_DATE]     VARCHAR (8)   NULL,
    [PROGRAM_ID]  VARCHAR (8)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

