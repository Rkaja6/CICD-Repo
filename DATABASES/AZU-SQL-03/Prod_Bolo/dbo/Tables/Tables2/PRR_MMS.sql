CREATE TABLE [dbo].[PRR_MMS] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [AGENCY_LEASE_NO] VARCHAR (13)  NULL,
    [EXEMPT]          VARCHAR (6)   NULL,
    [MMS_LEASE_NO]    VARCHAR (13)  NULL,
    [WELL_CODE]       VARCHAR (15)  NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

