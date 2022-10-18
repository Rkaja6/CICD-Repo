CREATE TABLE [dbo].[CD_CTL] (
    [u2_id]                    VARCHAR (255) NOT NULL,
    [CHANGE_FILE_NAME]         VARCHAR (4)   NULL,
    [CHECK_TRANSFER_FILE_PATH] VARCHAR (40)  NULL,
    [LAST_DUE_DATE]            DATETIME      NULL,
    [PRE_SELECT]               VARCHAR (3)   NULL,
    [PTR_CHANGE_FILE_NAME]     VARCHAR (12)  NULL,
    [PTR_CHECK_TRANSFER_PATH]  VARCHAR (20)  NULL,
    [time_stamp]               DATETIME      NULL,
    [u2_checksum]              VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

