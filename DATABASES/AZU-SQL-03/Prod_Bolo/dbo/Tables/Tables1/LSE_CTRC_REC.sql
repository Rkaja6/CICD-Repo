CREATE TABLE [dbo].[LSE_CTRC_REC] (
    [LSE_CTRC_REC_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [REC_BOOKS]       VARCHAR (6)   NULL,
    [REC_BOOK_TYPES]  VARCHAR (10)  NULL,
    [REC_DATES]       DATETIME      NULL,
    [REC_PAGES]       VARCHAR (7)   NULL,
    [REC_REFS]        VARCHAR (21)  NULL,
    [REC_STATUS]      VARCHAR (6)   NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LSE_CTRC_REC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LSE_CTRC_REC_u2_id_in]
    ON [dbo].[LSE_CTRC_REC]([u2_id] ASC);

