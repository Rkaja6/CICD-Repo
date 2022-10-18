CREATE TABLE [dbo].[RR_NM] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [DISTRICT]      VARCHAR (8)   NULL,
    [STATE_GAS_PRD] VARCHAR (3)   NULL,
    [STATE_LIQ_PRD] VARCHAR (3)   NULL,
    [STATE_OIL_PRD] VARCHAR (3)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

