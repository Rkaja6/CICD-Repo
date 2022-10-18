CREATE TABLE [dbo].[PRR_LA_R5D_RESULTS] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [COMPANY]      VARCHAR (3)   NULL,
    [COMPANY_NAME] VARCHAR (25)  NULL,
    [PROD_PERIOD]  DATETIME      NULL,
    [WELL_NAME]    VARCHAR (25)  NULL,
    [WELL_NO]      VARCHAR (10)  NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

