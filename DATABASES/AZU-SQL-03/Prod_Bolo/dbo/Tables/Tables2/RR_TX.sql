CREATE TABLE [dbo].[RR_TX] (
    [u2_id]              VARCHAR (255) NOT NULL,
    [ACTIVE_STATE_LEASE] VARCHAR (20)  NULL,
    [DFLT_CPTS_FLAG]     VARCHAR (4)   NULL,
    [LEASE_VOL_ORR]      VARCHAR (11)  NULL,
    [OGP_PROP_NO]        VARCHAR (12)  NULL,
    [STATE_LEASE_NAME]   VARCHAR (30)  NULL,
    [time_stamp]         DATETIME      NULL,
    [u2_checksum]        VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

