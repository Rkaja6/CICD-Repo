CREATE TABLE [dbo].[CO_UDF] (
    [CO_UDF_ID]        VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [USER_DATA_FIELDS] VARCHAR (10)  NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CO_UDF_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CO_UDF_u2_id_in]
    ON [dbo].[CO_UDF]([u2_id] ASC);

