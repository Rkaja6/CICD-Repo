CREATE TABLE [dbo].[WELL_DOWN] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [DUP_DOWN_DATE] DATETIME      NULL,
    [EQUIP_ID]      VARCHAR (10)  NULL,
    [EQUIP_TYPE]    VARCHAR (5)   NULL,
    [FACILITY]      VARCHAR (7)   NULL,
    [WELL]          VARCHAR (10)  NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

