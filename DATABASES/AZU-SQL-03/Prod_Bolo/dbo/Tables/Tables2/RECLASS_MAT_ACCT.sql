CREATE TABLE [dbo].[RECLASS_MAT_ACCT] (
    [RECLASS_MAT_ACCT_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [CONTRA_ACCTS]        VARCHAR (18)  NULL,
    [SOURCE_ACCTS]        VARCHAR (18)  NULL,
    [TARGET_ACCTS]        VARCHAR (18)  NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RECLASS_MAT_ACCT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RECLASS_MAT_ACCT_u2_id_in]
    ON [dbo].[RECLASS_MAT_ACCT]([u2_id] ASC);

