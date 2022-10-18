﻿CREATE TABLE [dbo].[RV_SYS_ST] (
    [RV_SYS_ST_ID] VARCHAR (255) NOT NULL,
    [u2_id]        VARCHAR (255) NULL,
    [SUP_STATE]    VARCHAR (2)   NULL,
    [time_stamp]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RV_SYS_ST_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RV_SYS_ST_u2_id_in]
    ON [dbo].[RV_SYS_ST]([u2_id] ASC);

