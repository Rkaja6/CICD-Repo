CREATE TABLE [dbo].[WELL_INFO_ITYPES] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [TI_MD_NRI]   VARCHAR (12)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

