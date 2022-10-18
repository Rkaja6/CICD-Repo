CREATE TABLE [dbo].[LSE_CTRC_TRACT_RECT] (
    [LSE_CTRC_TRACT_RECT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [LEG_SUBDIVS]            VARCHAR (11)  NULL,
    [RANGES]                 VARCHAR (4)   NULL,
    [SECTIONS]               VARCHAR (3)   NULL,
    [SEC_DESCS]              VARCHAR (115) NULL,
    [TOWNSHIPS]              VARCHAR (4)   NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LSE_CTRC_TRACT_RECT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LSE_CTRC_TRACT_RECT_u2_id_in]
    ON [dbo].[LSE_CTRC_TRACT_RECT]([u2_id] ASC);

