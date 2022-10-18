CREATE TABLE [dbo].[PRR_NM_PROPERTY] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [PROPERTY_NAME] VARCHAR (25)  NULL,
    [PROPERTY_POOL] VARCHAR (8)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

