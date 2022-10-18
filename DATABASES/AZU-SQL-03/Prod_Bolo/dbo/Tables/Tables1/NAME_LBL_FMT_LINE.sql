CREATE TABLE [dbo].[NAME_LBL_FMT_LINE] (
    [NAME_LBL_FMT_LINE_ID] VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [LABEL_LINES]          VARCHAR (8)   NULL,
    [NOTES]                VARCHAR (31)  NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([NAME_LBL_FMT_LINE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [NAME_LBL_FMT_LINE_u2_id_in]
    ON [dbo].[NAME_LBL_FMT_LINE]([u2_id] ASC);

