CREATE TABLE [dbo].[LSE_LBL_FMT_LNS] (
    [LSE_LBL_FMT_LNS_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [LABEL_LINES]        VARCHAR (24)  NULL,
    [NOTES]              VARCHAR (25)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LSE_LBL_FMT_LNS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LSE_LBL_FMT_LNS_u2_id_in]
    ON [dbo].[LSE_LBL_FMT_LNS]([u2_id] ASC);

