﻿CREATE TABLE [dbo].[USER_RPTS_COL] (
    [USER_RPTS_COL_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [COLUMN_HEADINGS]  VARCHAR (80)  NULL,
    [COLUMN_LOCS]      VARCHAR (8)   NULL,
    [COLUMN_NAMES]     VARCHAR (58)  NULL,
    [COLUMN_WIDTHS]    VARCHAR (6)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([USER_RPTS_COL_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [USER_RPTS_COL_u2_id_in]
    ON [dbo].[USER_RPTS_COL]([u2_id] ASC);

