CREATE TABLE [dbo].[AT_ASSET_DET_BALFWD_TRANS] (
    [AT_ASSET_DET_BALFWD_TRANS_ID] VARCHAR (255) NOT NULL,
    [u2_id]                        VARCHAR (255) NULL,
    [AT_TYPES]                     VARCHAR (7)   NULL,
    [TRANS_INDEX]                  VARCHAR (8)   NULL,
    [time_stamp]                   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AT_ASSET_DET_BALFWD_TRANS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_ASSET__u2_id_73043]
    ON [dbo].[AT_ASSET_DET_BALFWD_TRANS]([u2_id] ASC);

