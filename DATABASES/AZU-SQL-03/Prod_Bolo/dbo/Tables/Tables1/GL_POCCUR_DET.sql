CREATE TABLE [dbo].[GL_POCCUR_DET] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [ACCT]        VARCHAR (12)  NULL,
    [CC]          VARCHAR (10)  NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [COST_CENTER] VARCHAR (10)  NULL,
    [CURRENCY]    VARCHAR (10)  NULL,
    [PROJECT]     VARCHAR (28)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

