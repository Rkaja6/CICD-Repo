CREATE TABLE [dbo].[METER] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [DESCRIPTION] VARCHAR (41)  NULL,
    [METER_NO]    VARCHAR (11)  NULL,
    [METER_XREF]  VARCHAR (29)  NULL,
    [MMS_ID]      VARCHAR (7)   NULL,
    [PROPERTY]    VARCHAR (8)   NULL,
    [STATE_ID]    VARCHAR (5)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

