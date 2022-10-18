﻿CREATE TABLE [dbo].[PROJ_INS_BUD_IDX] (
    [subValueId]           VARCHAR (255) NOT NULL,
    [PROJ_BUD_ID]          VARCHAR (255) NULL,
    [INSIDER_BUDGET_INDEX] VARCHAR (49)  NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROJ_INS__PROJ_BUD__31675]
    ON [dbo].[PROJ_INS_BUD_IDX]([PROJ_BUD_ID] ASC);

