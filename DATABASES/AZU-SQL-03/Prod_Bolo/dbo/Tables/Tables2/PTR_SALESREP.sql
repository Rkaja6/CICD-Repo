CREATE TABLE [dbo].[PTR_SALESREP] (
    [u2_id]                  VARCHAR (255) NOT NULL,
    [CURR_BROKER]            VARCHAR (9)   NULL,
    [CURR_BROKER_EFF_DATE]   DATETIME      NULL,
    [EMAIL_ADDRESS]          VARCHAR (40)  NULL,
    [INFORMATION_PREFERENCE] VARCHAR (11)  NULL,
    [time_stamp]             DATETIME      NULL,
    [u2_checksum]            VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

