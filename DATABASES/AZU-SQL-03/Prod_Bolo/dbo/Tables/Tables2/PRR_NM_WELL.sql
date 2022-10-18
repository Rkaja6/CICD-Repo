CREATE TABLE [dbo].[PRR_NM_WELL] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [WELL_NAME]   VARCHAR (25)  NULL,
    [WELL_POOL]   VARCHAR (9)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

