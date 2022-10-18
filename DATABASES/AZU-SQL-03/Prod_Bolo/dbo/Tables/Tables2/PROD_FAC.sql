CREATE TABLE [dbo].[PROD_FAC] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [COMPANY]          VARCHAR (3)   NULL,
    [DESCRIPTION]      VARCHAR (40)  NULL,
    [FACILITY_NO]      VARCHAR (16)  NULL,
    [MMS_GAS_PLANT_NO] VARCHAR (11)  NULL,
    [MMS_ID]           VARCHAR (11)  NULL,
    [OPERATOR]         VARCHAR (8)   NULL,
    [TYPE]             VARCHAR (4)   NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

