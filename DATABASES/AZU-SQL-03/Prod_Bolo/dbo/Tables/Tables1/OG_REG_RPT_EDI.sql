CREATE TABLE [dbo].[OG_REG_RPT_EDI] (
    [OG_REG_RPT_EDI_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [EDI_REF]           VARCHAR (13)  NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OG_REG_RPT_EDI_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_REG_RPT_EDI_u2_id_in]
    ON [dbo].[OG_REG_RPT_EDI]([u2_id] ASC);

