CREATE TABLE [dbo].[PRR_MMS_LEASE] (
    [u2_id]               VARCHAR (255) NOT NULL,
    [OPERATOR_LEASE]      VARCHAR (20)  NULL,
    [OPERATOR_LEASE_NAME] VARCHAR (30)  NULL,
    [time_stamp]          DATETIME      NULL,
    [u2_checksum]         VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

