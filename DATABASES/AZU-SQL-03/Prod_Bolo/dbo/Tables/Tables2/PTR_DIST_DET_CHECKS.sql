CREATE TABLE [dbo].[PTR_DIST_DET_CHECKS] (
    [subValueId]              VARCHAR (255) NOT NULL,
    [PTR_DIST_DET_ADJ_PER_ID] VARCHAR (255) NULL,
    [ADJ_TYPES]               VARCHAR (4)   NULL,
    [CHECKS]                  VARCHAR (16)  NULL,
    [SYSTEM_DATE]             DATETIME      NULL,
    [SYSTEM_TIME]             VARCHAR (6)   NULL,
    [SYSTEM_USER_ID]          VARCHAR (6)   NULL,
    [TRANS_DATES]             DATETIME      NULL,
    [TRANS_INDEX]             VARCHAR (7)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTR_DIST__PTR_DIST__41774]
    ON [dbo].[PTR_DIST_DET_CHECKS]([PTR_DIST_DET_ADJ_PER_ID] ASC);

