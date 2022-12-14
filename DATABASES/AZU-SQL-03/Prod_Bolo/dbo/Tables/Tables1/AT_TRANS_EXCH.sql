CREATE TABLE [dbo].[AT_TRANS_EXCH] (
    [AT_TRANS_EXCH_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [EXCH_RATE]        VARCHAR (8)   NULL,
    [EXCH_RATE_DATE]   VARCHAR (8)   NULL,
    [EXCH_RATE_SOURCE] VARCHAR (8)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AT_TRANS_EXCH_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_TRANS_EXCH_u2_id_in]
    ON [dbo].[AT_TRANS_EXCH]([u2_id] ASC);

