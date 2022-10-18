CREATE TABLE [dbo].[OFP_CTL] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [DRIVER_TRACK_CAT] VARCHAR (7)   NULL,
    [INJ_PT_TRACK_CAT] VARCHAR (7)   NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

