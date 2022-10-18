﻿CREATE TABLE [dbo].[USER_RPT_FMT_LEFT] (
    [USER_RPT_FMT_LEFT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [LEFT_HEADING]         VARCHAR (16)  NULL,
    [LEFT_HEADING_FMT]     VARCHAR (4)   NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([USER_RPT_FMT_LEFT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [USER_RPT_FMT_LEFT_u2_id_in]
    ON [dbo].[USER_RPT_FMT_LEFT]([u2_id] ASC);

