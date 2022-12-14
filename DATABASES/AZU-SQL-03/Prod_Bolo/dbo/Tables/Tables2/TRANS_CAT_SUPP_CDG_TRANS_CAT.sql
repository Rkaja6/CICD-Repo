CREATE TABLE [dbo].[TRANS_CAT_SUPP_CDG_TRANS_CAT] (
    [subValueId]             VARCHAR (255) NOT NULL,
    [TRANS_CAT_PERSP_ID]     VARCHAR (255) NULL,
    [SUPP_CODING_TRANS_CATS] VARCHAR (10)  NULL,
    [SUPP_TRANS_CODES_REQ]   VARCHAR (5)   NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRANS_CAT_TRANS_CAT_76641]
    ON [dbo].[TRANS_CAT_SUPP_CDG_TRANS_CAT]([TRANS_CAT_PERSP_ID] ASC);

