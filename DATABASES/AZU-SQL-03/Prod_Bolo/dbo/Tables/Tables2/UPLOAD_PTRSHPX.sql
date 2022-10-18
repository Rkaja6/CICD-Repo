CREATE TABLE [dbo].[UPLOAD_PTRSHPX] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [BOLO_ID]     VARCHAR (11)  NULL,
    [ID]          VARCHAR (126) NULL,
    [_ID]         VARCHAR (126) NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

