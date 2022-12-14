CREATE TABLE [dbo].[PTRSHP_DIST_DET_DIST_DET_IDX] (
    [PTRSHP_DIST_DET_DIST_DET_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                           VARCHAR (255) NULL,
    [PTR_DIST_DET_INDEX]              VARCHAR (30)  NULL,
    [time_stamp]                      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PTRSHP_DIST_DET_DIST_DET_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTRSHP_DI_u2_id_28093]
    ON [dbo].[PTRSHP_DIST_DET_DIST_DET_IDX]([u2_id] ASC);

