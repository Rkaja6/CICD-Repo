﻿CREATE TABLE [dbo].[MDECK_ASSIGN_ATTRS] (
    [subValueId]      VARCHAR (255) NOT NULL,
    [MDECK_ASSIGN_ID] VARCHAR (255) NULL,
    [ASSIGN_ATTRS]    VARCHAR (20)  NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MDECK_ASS_MDECK_ASS_76010]
    ON [dbo].[MDECK_ASSIGN_ATTRS]([MDECK_ASSIGN_ID] ASC);

