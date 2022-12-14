CREATE TABLE [dbo].[WELL_INFO_CNT] (
    [WELL_INFO_CNT_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [WELL_COUNTS]      VARCHAR (5)   NULL,
    [WELL_TYPES_CNT]   VARCHAR (4)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([WELL_INFO_CNT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_INFO_CNT_u2_id_in]
    ON [dbo].[WELL_INFO_CNT]([u2_id] ASC);

