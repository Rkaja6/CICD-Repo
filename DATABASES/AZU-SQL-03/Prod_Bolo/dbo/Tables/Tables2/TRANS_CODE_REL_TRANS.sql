CREATE TABLE [dbo].[TRANS_CODE_REL_TRANS] (
    [TRANS_CODE_REL_TRANS_ID] VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [REL_TRANS_CATS]          VARCHAR (7)   NULL,
    [REL_TRANS_CODES]         VARCHAR (12)  NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([TRANS_CODE_REL_TRANS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRANS_CODE_REL_TRANS_u2_id_in]
    ON [dbo].[TRANS_CODE_REL_TRANS]([u2_id] ASC);

