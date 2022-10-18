CREATE TABLE [dbo].[AT_INV_FAC] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [FACILITY_NO] VARCHAR (12)  NULL,
    [TYPE]        VARCHAR (4)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

