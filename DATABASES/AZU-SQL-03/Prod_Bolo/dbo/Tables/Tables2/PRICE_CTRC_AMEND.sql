CREATE TABLE [dbo].[PRICE_CTRC_AMEND] (
    [PRICE_CTRC_AMEND_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [AMENDMENT_DATES]     DATETIME      NULL,
    [AMENDMENT_REF]       VARCHAR (5)   NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRICE_CTRC_AMEND_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRICE_CTRC_AMEND_u2_id_in]
    ON [dbo].[PRICE_CTRC_AMEND]([u2_id] ASC);

