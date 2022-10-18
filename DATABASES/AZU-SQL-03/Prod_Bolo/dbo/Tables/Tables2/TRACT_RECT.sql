CREATE TABLE [dbo].[TRACT_RECT] (
    [TRACT_RECT_ID]       VARCHAR (255)   NOT NULL,
    [u2_id]               VARCHAR (255)   NULL,
    [FF_SEC_DESCS]        VARCHAR (7975)  NULL,
    [LEG_SUBDIVS]         VARCHAR (10)    NULL,
    [RANGES]              VARCHAR (6)     NULL,
    [SECTIONS]            VARCHAR (4)     NULL,
    [SECTION_GROSS_ACRES] NUMERIC (19, 4) NULL,
    [SEC_DESCS]           VARCHAR (7975)  NULL,
    [TOWNSHIPS]           VARCHAR (4)     NULL,
    [time_stamp]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([TRACT_RECT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRACT_RECT_u2_id_in]
    ON [dbo].[TRACT_RECT]([u2_id] ASC);

