CREATE TABLE [dbo].[UPLOAD_CCX] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [CNV_NAME_ID]   VARCHAR (15)  NULL,
    [FINAL_GWIZ_ID] VARCHAR (9)   NULL,
    [GWIZ_CC_ID]    VARCHAR (10)  NULL,
    [ID]            VARCHAR (126) NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

