﻿CREATE TABLE [dbo].[CO_USG] (
    [CO_USG_ID]   VARCHAR (255) NOT NULL,
    [u2_id]       VARCHAR (255) NULL,
    [USAGE_INDEX] VARCHAR (5)   NULL,
    [time_stamp]  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CO_USG_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CO_USG_u2_id_in]
    ON [dbo].[CO_USG]([u2_id] ASC);

