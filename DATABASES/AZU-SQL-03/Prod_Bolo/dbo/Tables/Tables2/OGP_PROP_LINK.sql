CREATE TABLE [dbo].[OGP_PROP_LINK] (
    [OGP_PROP_LINK_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [LINKS]            VARCHAR (20)  NULL,
    [LINK_TYPES]       VARCHAR (6)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OGP_PROP_LINK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_PROP_LINK_u2_id_in]
    ON [dbo].[OGP_PROP_LINK]([u2_id] ASC);

