CREATE TABLE [dbo].[TRACT_SURVEYS] (
    [TRACT_SURVEYS_ID]           VARCHAR (255)   NOT NULL,
    [u2_id]                      VARCHAR (255)   NULL,
    [SURVEYS]                    VARCHAR (24)    NULL,
    [SURVEY_BLOCKS]              VARCHAR (4)     NULL,
    [SURVEY_SECTIONS]            VARCHAR (21)    NULL,
    [SURVEY_SECTION_GROSS_ACRES] NUMERIC (19, 4) NULL,
    [SURVEY_SEC_DESCS]           VARCHAR (3079)  NULL,
    [SURVEY_TOWNSHIPS]           VARCHAR (3)     NULL,
    [time_stamp]                 DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([TRACT_SURVEYS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRACT_SURVEYS_u2_id_in]
    ON [dbo].[TRACT_SURVEYS]([u2_id] ASC);

