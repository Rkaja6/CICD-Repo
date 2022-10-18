﻿CREATE TABLE [dbo].[CO_CURR] (
    [CO_CURR_ID] VARCHAR (255) NOT NULL,
    [u2_id]      VARCHAR (255) NULL,
    [EXG_SRCS]   VARCHAR (8)   NULL,
    [RPT_CURRS]  VARCHAR (9)   NULL,
    [TOLERANCES] NUMERIC (9)   NULL,
    [time_stamp] DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CO_CURR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CO_CURR_u2_id_in]
    ON [dbo].[CO_CURR]([u2_id] ASC);

