CREATE TABLE [dbo].[CC_INTERESTS] (
    [u2_id]       VARCHAR (255)   NOT NULL,
    [TI_NRI]      NUMERIC (19, 2) NULL,
    [TI_WI]       NUMERIC (19, 2) NULL,
    [time_stamp]  DATETIME        NULL,
    [u2_checksum] VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

