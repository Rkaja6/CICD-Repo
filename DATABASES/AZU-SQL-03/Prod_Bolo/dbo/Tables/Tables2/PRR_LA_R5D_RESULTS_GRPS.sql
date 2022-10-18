CREATE TABLE [dbo].[PRR_LA_R5D_RESULTS_GRPS] (
    [subValueId]                 VARCHAR (255) NOT NULL,
    [PRR_LA_R5D_RESULTS_WELL_ID] VARCHAR (255) NULL,
    [GROUP_CODE]                 VARCHAR (7)   NULL,
    [GROUP_CO_CODE]              VARCHAR (10)  NULL,
    [GROUP_FP]                   VARCHAR (8)   NULL,
    [VOLUME]                     NUMERIC (9)   NULL,
    [time_stamp]                 DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRR_LA_R5_PRR_LA_R5_10391]
    ON [dbo].[PRR_LA_R5D_RESULTS_GRPS]([PRR_LA_R5D_RESULTS_WELL_ID] ASC);

