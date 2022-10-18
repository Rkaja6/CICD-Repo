CREATE TABLE [dbo].[OBD_WELL_COUNT] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COST_CENTER] VARCHAR (12)  NULL,
    [EFF_DATE]    DATETIME      NULL,
    [UPDATE_PGM]  VARCHAR (7)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

