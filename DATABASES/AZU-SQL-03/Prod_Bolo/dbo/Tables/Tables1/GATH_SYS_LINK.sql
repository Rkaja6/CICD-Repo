CREATE TABLE [dbo].[GATH_SYS_LINK] (
    [GATH_SYS_LINK_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [LINKS]            VARCHAR (25)  NULL,
    [LINK_TYPES]       VARCHAR (6)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([GATH_SYS_LINK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GATH_SYS_LINK_u2_id_in]
    ON [dbo].[GATH_SYS_LINK]([u2_id] ASC);

