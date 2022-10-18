CREATE TABLE [dbo].[UOM_CONV] (
    [u2_id]       VARCHAR (255)   NOT NULL,
    [FACTOR]      NUMERIC (19, 5) NULL,
    [time_stamp]  DATETIME        NULL,
    [u2_checksum] VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

