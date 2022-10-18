CREATE TABLE [dbo].[CC_INDEX_CC_IDS] (
    [CC_INDEX_CC_IDS_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [CC_ID]              VARCHAR (15)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CC_INDEX_CC_IDS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_INDEX_CC_IDS_u2_id_in]
    ON [dbo].[CC_INDEX_CC_IDS]([u2_id] ASC);

