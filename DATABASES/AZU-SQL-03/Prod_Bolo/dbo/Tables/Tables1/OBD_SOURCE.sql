CREATE TABLE [dbo].[OBD_SOURCE] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CC_XREF_REQ] VARCHAR (6)   NULL,
    [DESCRIPTION] VARCHAR (34)  NULL,
    [POSTABLE]    VARCHAR (8)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

