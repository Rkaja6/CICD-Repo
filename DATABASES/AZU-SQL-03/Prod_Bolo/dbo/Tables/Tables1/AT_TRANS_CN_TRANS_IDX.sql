CREATE TABLE [dbo].[AT_TRANS_CN_TRANS_IDX] (
    [AT_TRANS_CN_TRANS_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [CN_TRANS_INDEX]           VARCHAR (9)   NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AT_TRANS_CN_TRANS_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_TRANS_CN_TRANS_IDX_u2_id_in]
    ON [dbo].[AT_TRANS_CN_TRANS_IDX]([u2_id] ASC);

