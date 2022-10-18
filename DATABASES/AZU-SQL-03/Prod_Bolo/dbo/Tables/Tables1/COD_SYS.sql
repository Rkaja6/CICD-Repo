CREATE TABLE [dbo].[COD_SYS] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CODE_CO_ID]  VARCHAR (7)   NULL,
    [DFLT_DRIVER] VARCHAR (7)   NULL,
    [DFLT_METER]  VARCHAR (9)   NULL,
    [DFLT_PRD]    VARCHAR (7)   NULL,
    [DFLT_TANK]   VARCHAR (7)   NULL,
    [RCV_CODE]    VARCHAR (3)   NULL,
    [SEND_CODE]   VARCHAR (4)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

