CREATE TABLE [dbo].[AT_TRANS_TRANS_CODE] (
    [AT_TRANS_TRANS_CODE_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [TRANS_CATS]             VARCHAR (17)  NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AT_TRANS_TRANS_CODE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_TRANS_TRANS_CODE_u2_id_in]
    ON [dbo].[AT_TRANS_TRANS_CODE]([u2_id] ASC);

