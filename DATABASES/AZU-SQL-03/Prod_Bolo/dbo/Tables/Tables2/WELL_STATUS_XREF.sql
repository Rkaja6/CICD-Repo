CREATE TABLE [dbo].[WELL_STATUS_XREF] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [WELL_STATUS] VARCHAR (6)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

