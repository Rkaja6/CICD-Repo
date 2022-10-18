CREATE TABLE [dbo].[LEGAL_DESC_RECT] (
    [LEGAL_DESC_RECT_ID]  VARCHAR (255)   NOT NULL,
    [u2_id]               VARCHAR (255)   NULL,
    [LEG_SUBDIVS]         VARCHAR (10)    NULL,
    [MAP_INDEX_GRID]      VARCHAR (5)     NULL,
    [RANGES]              VARCHAR (6)     NULL,
    [SECTIONS]            VARCHAR (4)     NULL,
    [SECTION_GROSS_ACRES] NUMERIC (19, 4) NULL,
    [TOWNSHIPS]           VARCHAR (4)     NULL,
    [time_stamp]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([LEGAL_DESC_RECT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LEGAL_DESC_RECT_u2_id_in]
    ON [dbo].[LEGAL_DESC_RECT]([u2_id] ASC);

