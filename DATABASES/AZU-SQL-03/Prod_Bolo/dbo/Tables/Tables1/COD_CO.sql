CREATE TABLE [dbo].[COD_CO] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [CLEARINGHOUSE] VARCHAR (6)   NULL,
    [CODE_STATUS]   VARCHAR (4)   NULL,
    [NAME_ID]       VARCHAR (8)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

