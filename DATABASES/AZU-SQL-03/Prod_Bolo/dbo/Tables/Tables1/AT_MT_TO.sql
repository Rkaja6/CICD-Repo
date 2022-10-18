CREATE TABLE [dbo].[AT_MT_TO] (
    [AT_MT_TO_ID]    VARCHAR (255) NOT NULL,
    [u2_id]          VARCHAR (255) NULL,
    [TO_TRANS_CATS]  VARCHAR (9)   NULL,
    [TO_TRANS_CODES] VARCHAR (8)   NULL,
    [time_stamp]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AT_MT_TO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_MT_TO_u2_id_in]
    ON [dbo].[AT_MT_TO]([u2_id] ASC);

