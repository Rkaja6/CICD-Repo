CREATE TABLE [dbo].[STATE_EDI] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [DLM]         VARCHAR (5)   NULL,
    [RPT_FILE]    VARCHAR (20)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

