CREATE TABLE [dbo].[AT_DEPR_PROF_EFF_DT] (
    [subValueId]            VARCHAR (255)   NOT NULL,
    [AT_DEPR_PROF_PSPTV_ID] VARCHAR (255)   NULL,
    [DEPR_METHODS]          VARCHAR (14)    NULL,
    [EFF_DATES]             DATETIME        NULL,
    [SALVAGE_PCTS]          NUMERIC (19, 2) NULL,
    [UOP_DDA_CATS]          VARCHAR (8)     NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_DEPR_P_AT_DEPR_P_40998]
    ON [dbo].[AT_DEPR_PROF_EFF_DT]([AT_DEPR_PROF_PSPTV_ID] ASC);

