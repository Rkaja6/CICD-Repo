CREATE TABLE [dbo].[STD_RPT_FMT_PROPL] (
    [STD_RPT_FMT_PROPL_ID] VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [PROPERTY_LEDGERS]     VARCHAR (8)   NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([STD_RPT_FMT_PROPL_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STD_RPT_FMT_PROPL_u2_id_in]
    ON [dbo].[STD_RPT_FMT_PROPL]([u2_id] ASC);

