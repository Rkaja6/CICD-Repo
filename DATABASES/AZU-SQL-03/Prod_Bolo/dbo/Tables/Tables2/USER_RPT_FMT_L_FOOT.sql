﻿CREATE TABLE [dbo].[USER_RPT_FMT_L_FOOT] (
    [USER_RPT_FMT_L_FOOT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [LEFT_FOOTING]           VARCHAR (20)  NULL,
    [LEFT_FOOTING_FMT]       VARCHAR (7)   NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([USER_RPT_FMT_L_FOOT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [USER_RPT_FMT_L_FOOT_u2_id_in]
    ON [dbo].[USER_RPT_FMT_L_FOOT]([u2_id] ASC);

