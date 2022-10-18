CREATE TABLE [dbo].[OGP_PROP_RR] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [COMPANY]         VARCHAR (3)   NULL,
    [INACTIVE_DATE]   DATETIME      NULL,
    [PUN]             VARCHAR (17)  NULL,
    [STATE_PROP_NAME] VARCHAR (30)  NULL,
    [ST_PRD_CD]       VARCHAR (3)   NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

