CREATE TABLE [dbo].[CTRC_VOL_DET_IDX] (
    [CTRC_VOL_DET_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [DETAIL_INDEX]        VARCHAR (12)  NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CTRC_VOL_DET_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CTRC_VOL_DET_IDX_u2_id_in]
    ON [dbo].[CTRC_VOL_DET_IDX]([u2_id] ASC);

