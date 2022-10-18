CREATE TABLE [dbo].[ROY_UOT_SYS] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [AGENCY_TYPE] VARCHAR (6)   NULL,
    [UOT_CO_NO]   VARCHAR (7)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

