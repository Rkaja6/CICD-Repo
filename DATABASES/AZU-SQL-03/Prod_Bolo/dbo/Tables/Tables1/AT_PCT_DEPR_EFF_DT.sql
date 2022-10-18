CREATE TABLE [dbo].[AT_PCT_DEPR_EFF_DT] (
    [AT_PCT_DEPR_EFF_DT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                 VARCHAR (255)   NULL,
    [DEPR_PCTS]             NUMERIC (19, 2) NULL,
    [EFF_DATES]             DATETIME        NULL,
    [EXP_DATES]             DATETIME        NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([AT_PCT_DEPR_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_PCT_DEPR_EFF_DT_u2_id_in]
    ON [dbo].[AT_PCT_DEPR_EFF_DT]([u2_id] ASC);

