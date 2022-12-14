CREATE TABLE [dbo].[OFP_DRIVER_UDF] (
    [OFP_DRIVER_UDF_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [USER_DATA_FIELDS]  VARCHAR (10)  NULL,
    [USER_DATA_VALUES]  VARCHAR (10)  NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OFP_DRIVER_UDF_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OFP_DRIVER_UDF_u2_id_in]
    ON [dbo].[OFP_DRIVER_UDF]([u2_id] ASC);

