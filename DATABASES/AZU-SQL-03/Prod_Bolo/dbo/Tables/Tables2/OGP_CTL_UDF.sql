CREATE TABLE [dbo].[OGP_CTL_UDF] (
    [OGP_CTL_UDF_ID]        VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [USER_DATA_FIELDS_PROP] VARCHAR (10)  NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OGP_CTL_UDF_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_CTL_UDF_u2_id_in]
    ON [dbo].[OGP_CTL_UDF]([u2_id] ASC);

