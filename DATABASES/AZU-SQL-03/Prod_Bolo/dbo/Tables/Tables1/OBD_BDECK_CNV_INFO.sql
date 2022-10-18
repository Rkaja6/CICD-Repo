CREATE TABLE [dbo].[OBD_BDECK_CNV_INFO] (
    [OBD_BDECK_CNV_INFO_ID] VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [CNV_ID]                VARCHAR (25)  NULL,
    [CNV_NAME]              VARCHAR (5)   NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OBD_BDECK_CNV_INFO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OBD_BDECK_CNV_INFO_u2_id_in]
    ON [dbo].[OBD_BDECK_CNV_INFO]([u2_id] ASC);

