CREATE TABLE [dbo].[OG_CTRC_PRD] (
    [OG_CTRC_PRD_ID] VARCHAR (255) NOT NULL,
    [u2_id]          VARCHAR (255) NULL,
    [PRODUCTS]       VARCHAR (3)   NULL,
    [PURCHASERS]     VARCHAR (9)   NULL,
    [time_stamp]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OG_CTRC_PRD_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_CTRC_PRD_u2_id_in]
    ON [dbo].[OG_CTRC_PRD]([u2_id] ASC);

