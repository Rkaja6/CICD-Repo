﻿CREATE TABLE [dbo].[WELL_INFO_WELL_TYPE] (
    [WELL_INFO_WELL_TYPE_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [PROP_TYPE]              VARCHAR (6)   NULL,
    [STATUS]                 VARCHAR (5)   NULL,
    [STATUS_EFF_DATES]       DATETIME      NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([WELL_INFO_WELL_TYPE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_INFO_WELL_TYPE_u2_id_in]
    ON [dbo].[WELL_INFO_WELL_TYPE]([u2_id] ASC);

