﻿CREATE TABLE [dbo].[WELL_INFO_SURVEY] (
    [WELL_INFO_SURVEY_ID] VARCHAR (255)  NOT NULL,
    [u2_id]               VARCHAR (255)  NULL,
    [SURVEYS]             VARCHAR (24)   NULL,
    [SURVEY_BLOCKS]       VARCHAR (3)    NULL,
    [SURVEY_SECTIONS]     VARCHAR (3)    NULL,
    [SURVEY_SEC_DESCS]    VARCHAR (1971) NULL,
    [SURVEY_TOWNSHIPS]    VARCHAR (3)    NULL,
    [time_stamp]          DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([WELL_INFO_SURVEY_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_INFO_SURVEY_u2_id_in]
    ON [dbo].[WELL_INFO_SURVEY]([u2_id] ASC);

