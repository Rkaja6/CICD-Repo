CREATE TABLE [dbo].[OG_CTRC_INT] (
    [OG_CTRC_INT_ID]    VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [INT_CATS]          VARCHAR (3)   NULL,
    [INT_CAT_PAY_CODES] VARCHAR (8)   NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OG_CTRC_INT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_CTRC_INT_u2_id_in]
    ON [dbo].[OG_CTRC_INT]([u2_id] ASC);

