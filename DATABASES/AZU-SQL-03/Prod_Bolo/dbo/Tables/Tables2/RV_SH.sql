CREATE TABLE [dbo].[RV_SH] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [ANALYST]       VARCHAR (10)  NULL,
    [DESCRIPTION]   VARCHAR (48)  NULL,
    [WIRE_TRANSFER] VARCHAR (4)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

