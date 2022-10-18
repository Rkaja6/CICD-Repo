CREATE TABLE [dbo].[WELL_INFO_LBL_FMT_LBL] (
    [WELL_INFO_LBL_FMT_LBL_ID] VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [LABEL_LINES]              VARCHAR (16)  NULL,
    [NOTES]                    VARCHAR (25)  NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([WELL_INFO_LBL_FMT_LBL_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_INFO_LBL_FMT_LBL_u2_id_in]
    ON [dbo].[WELL_INFO_LBL_FMT_LBL]([u2_id] ASC);

