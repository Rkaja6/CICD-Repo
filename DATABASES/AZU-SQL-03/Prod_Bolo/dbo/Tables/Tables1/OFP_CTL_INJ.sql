CREATE TABLE [dbo].[OFP_CTL_INJ] (
    [OFP_CTL_INJ_ID]          VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [USER_DATA_FIELDS_INJ_PT] VARCHAR (10)  NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OFP_CTL_INJ_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OFP_CTL_INJ_u2_id_in]
    ON [dbo].[OFP_CTL_INJ]([u2_id] ASC);

