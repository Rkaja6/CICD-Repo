CREATE TABLE [dbo].[PTRSHP_COA_GRP] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [DESCRIPTION]    VARCHAR (30)  NULL,
    [EXPENSE_INCOME] VARCHAR (9)   NULL,
    [INSIDER_ACCT]   VARCHAR (15)  NULL,
    [PRODUCT]        VARCHAR (4)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

