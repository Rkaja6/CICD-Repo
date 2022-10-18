﻿CREATE TABLE [dbo].[GATH_SYS_SUB_GATH_SYSTEMS] (
    [GATH_SYS_SUB_GATH_SYSTEMS_ID] VARCHAR (255) NOT NULL,
    [u2_id]                        VARCHAR (255) NULL,
    [SUB_GATH_SYS]                 VARCHAR (13)  NULL,
    [time_stamp]                   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([GATH_SYS_SUB_GATH_SYSTEMS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GATH_SYS__u2_id_34186]
    ON [dbo].[GATH_SYS_SUB_GATH_SYSTEMS]([u2_id] ASC);

