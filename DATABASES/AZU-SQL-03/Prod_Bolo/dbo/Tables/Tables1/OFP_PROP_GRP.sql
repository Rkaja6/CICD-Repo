CREATE TABLE [dbo].[OFP_PROP_GRP] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [DESCRIPTION] VARCHAR (30)  NULL,
    [GROUP_NAME]  VARCHAR (20)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

