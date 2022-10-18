CREATE TABLE [dbo].[ESCROW_RULES] (
    [u2_id]             VARCHAR (255) NOT NULL,
    [DOFS_GRACE_PERIOD] NUMERIC (9)   NULL,
    [ESCROW_AGENT]      VARCHAR (9)   NULL,
    [ID]                VARCHAR (126) NULL,
    [SS_GRACE_PERIOD]   NUMERIC (9)   NULL,
    [time_stamp]        DATETIME      NULL,
    [u2_checksum]       VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

