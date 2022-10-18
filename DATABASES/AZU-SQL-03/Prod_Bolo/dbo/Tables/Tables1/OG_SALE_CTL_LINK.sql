CREATE TABLE [dbo].[OG_SALE_CTL_LINK] (
    [OG_SALE_CTL_LINK_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [LINKS]               VARCHAR (20)  NULL,
    [LINK_TYPES]          VARCHAR (10)  NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OG_SALE_CTL_LINK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_SALE_CTL_LINK_u2_id_in]
    ON [dbo].[OG_SALE_CTL_LINK]([u2_id] ASC);

