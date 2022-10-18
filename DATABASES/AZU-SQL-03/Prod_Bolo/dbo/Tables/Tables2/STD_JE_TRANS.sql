CREATE TABLE [dbo].[STD_JE_TRANS] (
    [STD_JE_TRANS_ID]      VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [JE_INDEX]             VARCHAR (12)  NULL,
    [POSTED_ACCTG_PERIODS] DATETIME      NULL,
    [TRANS_INDEX]          VARCHAR (9)   NULL,
    [TRANS_TYPES]          VARCHAR (5)   NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([STD_JE_TRANS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STD_JE_TRANS_u2_id_in]
    ON [dbo].[STD_JE_TRANS]([u2_id] ASC);

