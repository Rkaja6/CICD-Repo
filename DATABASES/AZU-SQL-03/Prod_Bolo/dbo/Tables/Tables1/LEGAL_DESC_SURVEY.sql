CREATE TABLE [dbo].[LEGAL_DESC_SURVEY] (
    [LEGAL_DESC_SURVEY_ID]       VARCHAR (255)   NOT NULL,
    [u2_id]                      VARCHAR (255)   NULL,
    [MAP_INDEX_SURVEY]           VARCHAR (6)     NULL,
    [SURVEYS]                    VARCHAR (24)    NULL,
    [SURVEY_BLOCKS]              VARCHAR (4)     NULL,
    [SURVEY_SECTIONS]            VARCHAR (21)    NULL,
    [SURVEY_SECTION_GROSS_ACRES] NUMERIC (19, 4) NULL,
    [SURVEY_TOWNSHIPS]           VARCHAR (3)     NULL,
    [time_stamp]                 DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([LEGAL_DESC_SURVEY_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LEGAL_DESC_SURVEY_u2_id_in]
    ON [dbo].[LEGAL_DESC_SURVEY]([u2_id] ASC);

