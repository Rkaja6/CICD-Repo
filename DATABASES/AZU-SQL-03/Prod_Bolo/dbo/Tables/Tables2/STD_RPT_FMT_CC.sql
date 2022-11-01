﻿CREATE TABLE [dbo].[STD_RPT_FMT_CC] (
    [STD_RPT_FMT_CC_ID]   VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [COST_CENTER_REPORTS] VARCHAR (7)   NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([STD_RPT_FMT_CC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STD_RPT_FMT_CC_u2_id_in]
    ON [dbo].[STD_RPT_FMT_CC]([u2_id] ASC);
