CREATE TABLE [dbo].[LSE_CTRC_TRACT_SURVEY] (
    [LSE_CTRC_TRACT_SURVEY_ID] VARCHAR (255)  NOT NULL,
    [u2_id]                    VARCHAR (255)  NULL,
    [SURVEYS]                  VARCHAR (10)   NULL,
    [SURVEY_BLOCKS]            VARCHAR (5)    NULL,
    [SURVEY_SECTIONS]          VARCHAR (7)    NULL,
    [SURVEY_SEC_DESCS]         VARCHAR (1344) NULL,
    [SURVEY_TOWNSHIPS]         VARCHAR (3)    NULL,
    [time_stamp]               DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([LSE_CTRC_TRACT_SURVEY_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LSE_CTRC_TRACT_SURVEY_u2_id_in]
    ON [dbo].[LSE_CTRC_TRACT_SURVEY]([u2_id] ASC);

