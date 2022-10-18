CREATE TABLE [dbo].[DISP_XREF] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [DAVE_DISP]   VARCHAR (4)   NULL,
    [DESCRIPTION] VARCHAR (30)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

