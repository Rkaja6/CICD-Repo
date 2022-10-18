﻿CREATE TABLE [dbo].[CONTACT] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [ASSOCIATE]    VARCHAR (9)   NULL,
    [CONTACT_TYPE] VARCHAR (7)   NULL,
    [CO_NAME]      VARCHAR (9)   NULL,
    [EXP_DATE]     DATETIME      NULL,
    [NAME]         VARCHAR (25)  NULL,
    [RECALL_CODE]  VARCHAR (6)   NULL,
    [RECALL_DATE]  DATETIME      NULL,
    [STATUS]       VARCHAR (6)   NULL,
    [TIMEX]        VARCHAR (5)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

