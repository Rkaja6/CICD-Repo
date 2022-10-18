CREATE TABLE [dbo].[RECLASS_MAT] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [DETAIL_TRANS] VARCHAR (6)   NULL,
    [RECLASS_CODE] VARCHAR (7)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

