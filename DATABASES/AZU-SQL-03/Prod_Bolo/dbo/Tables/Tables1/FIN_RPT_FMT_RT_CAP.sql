﻿CREATE TABLE [dbo].[FIN_RPT_FMT_RT_CAP] (
    [FIN_RPT_FMT_RT_CAP_ID] VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [RIGHT_CAPTION]         VARCHAR (20)  NULL,
    [RIGHT_CAPTION_FMT]     VARCHAR (7)   NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([FIN_RPT_FMT_RT_CAP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [FIN_RPT_FMT_RT_CAP_u2_id_in]
    ON [dbo].[FIN_RPT_FMT_RT_CAP]([u2_id] ASC);

