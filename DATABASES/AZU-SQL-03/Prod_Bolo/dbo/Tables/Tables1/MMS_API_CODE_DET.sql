CREATE TABLE [dbo].[MMS_API_CODE_DET] (
    [MMS_API_CODE_DET_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [API_CODE]            VARCHAR (4)   NULL,
    [DESCRIPTION]         VARCHAR (30)  NULL,
    [MMS_CODE]            VARCHAR (4)   NULL,
    [MMS_DOC_TYPE]        VARCHAR (4)   NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([MMS_API_CODE_DET_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MMS_API_CODE_DET_u2_id_in]
    ON [dbo].[MMS_API_CODE_DET]([u2_id] ASC);

