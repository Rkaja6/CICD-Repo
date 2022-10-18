CREATE TABLE [dbo].[WELL_VOL] (
    [u2_id]       VARCHAR (255)   NOT NULL,
    [TEMP_MCFS]   NUMERIC (19, 2) NULL,
    [TEMP_MMBTUS] NUMERIC (19, 2) NULL,
    [time_stamp]  DATETIME        NULL,
    [u2_checksum] VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

