CREATE TABLE [dbo].[OG_CTRC_CCPT] (
    [OG_CTRC_CCPT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]           VARCHAR (255)   NULL,
    [CALC_BASIS]      VARCHAR (10)    NULL,
    [CCPTS]           VARCHAR (4)     NULL,
    [CPRODUCTS]       VARCHAR (4)     NULL,
    [RATES]           NUMERIC (19, 6) NULL,
    [time_stamp]      DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([OG_CTRC_CCPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_CTRC_CCPT_u2_id_in]
    ON [dbo].[OG_CTRC_CCPT]([u2_id] ASC);

