CREATE TABLE [dbo].[PROSPECT_OFFSHORE] (
    [PROSPECT_OFFSHORE_ID] VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [OFFSHORE_AREAS]       VARCHAR (8)   NULL,
    [OFFSHORE_BLOCKS]      VARCHAR (5)   NULL,
    [OFFSHORE_DESCS]       VARCHAR (30)  NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PROSPECT_OFFSHORE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROSPECT_OFFSHORE_u2_id_in]
    ON [dbo].[PROSPECT_OFFSHORE]([u2_id] ASC);

