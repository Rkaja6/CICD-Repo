CREATE TABLE [dbo].[EXT_IMAGE_JCTL] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [LOGNAME]     VARCHAR (15)  NULL,
    [PH_ID]       VARCHAR (30)  NULL,
    [PID]         VARCHAR (7)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

