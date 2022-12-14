CREATE TABLE [dbo].[AV_CTL_SUM_WZ_TP] (
    [AV_CTL_SUM_WZ_TP_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [SUM_WELL_CC_TYPES]   VARCHAR (8)   NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AV_CTL_SUM_WZ_TP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AV_CTL_SUM_WZ_TP_u2_id_in]
    ON [dbo].[AV_CTL_SUM_WZ_TP]([u2_id] ASC);

