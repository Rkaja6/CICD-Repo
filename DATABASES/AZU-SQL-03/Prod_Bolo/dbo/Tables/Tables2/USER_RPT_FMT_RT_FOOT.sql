﻿CREATE TABLE [dbo].[USER_RPT_FMT_RT_FOOT] (
    [USER_RPT_FMT_RT_FOOT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [RIGHT_FOOTING]           VARCHAR (24)  NULL,
    [RIGHT_FOOTING_FMT]       VARCHAR (7)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([USER_RPT_FMT_RT_FOOT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [USER_RPT_FMT_RT_FOOT_u2_id_in]
    ON [dbo].[USER_RPT_FMT_RT_FOOT]([u2_id] ASC);
