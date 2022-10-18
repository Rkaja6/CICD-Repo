﻿CREATE TABLE [dbo].[COM_CTL] (
    [u2_id]                  VARCHAR (255) NOT NULL,
    [COMPANY_LEVEL_SECURITY] VARCHAR (5)   NULL,
    [SMART_MAILER]           VARCHAR (2)   NULL,
    [XML_TARGET_PATH]        VARCHAR (30)  NULL,
    [time_stamp]             DATETIME      NULL,
    [u2_checksum]            VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

