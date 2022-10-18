CREATE TABLE [dbo].[TANK_TABLE] (
    [u2_id]                VARCHAR (255)   NOT NULL,
    [FRACTIONAL_INCREMENT] VARCHAR (10)    NULL,
    [TANK_ID]              VARCHAR (10)    NULL,
    [TANK_TABLEX]          VARCHAR (12)    NULL,
    [TOTAL_VOLUME]         NUMERIC (19, 5) NULL,
    [time_stamp]           DATETIME        NULL,
    [u2_checksum]          VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

