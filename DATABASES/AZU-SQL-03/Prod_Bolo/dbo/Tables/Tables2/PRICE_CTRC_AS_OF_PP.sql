CREATE TABLE [dbo].[PRICE_CTRC_AS_OF_PP] (
    [PRICE_CTRC_AS_OF_PP_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                  VARCHAR (255)   NULL,
    [AS_OF_BONUS_DECM]       NUMERIC (19, 4) NULL,
    [time_stamp]             DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PRICE_CTRC_AS_OF_PP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRICE_CTRC_AS_OF_PP_u2_id_in]
    ON [dbo].[PRICE_CTRC_AS_OF_PP]([u2_id] ASC);

