﻿CREATE TABLE [dbo].[VOU_SRC_APP] (
    [VOU_SRC_APP_ID] VARCHAR (255) NOT NULL,
    [u2_id]          VARCHAR (255) NULL,
    [APPS_ID]        VARCHAR (12)  NULL,
    [time_stamp]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([VOU_SRC_APP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [VOU_SRC_APP_u2_id_in]
    ON [dbo].[VOU_SRC_APP]([u2_id] ASC);
