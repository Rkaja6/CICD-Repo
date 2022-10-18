CREATE TABLE [dbo].[LSE_CTRC_LBL_FMT_LINE] (
    [LSE_CTRC_LBL_FMT_LINE_ID] VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [LABEL_LINES]              VARCHAR (24)  NULL,
    [NOTES]                    VARCHAR (25)  NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LSE_CTRC_LBL_FMT_LINE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LSE_CTRC_LBL_FMT_LINE_u2_id_in]
    ON [dbo].[LSE_CTRC_LBL_FMT_LINE]([u2_id] ASC);

