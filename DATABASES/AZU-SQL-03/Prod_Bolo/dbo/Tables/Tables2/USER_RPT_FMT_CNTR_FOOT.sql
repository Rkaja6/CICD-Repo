﻿CREATE TABLE [dbo].[USER_RPT_FMT_CNTR_FOOT] (
    [USER_RPT_FMT_CNTR_FOOT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                     VARCHAR (255) NULL,
    [CENTER_FOOTING]            VARCHAR (20)  NULL,
    [CENTER_FOOTING_FMT]        VARCHAR (7)   NULL,
    [time_stamp]                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([USER_RPT_FMT_CNTR_FOOT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [USER_RPT__u2_id_54223]
    ON [dbo].[USER_RPT_FMT_CNTR_FOOT]([u2_id] ASC);

