﻿CREATE TABLE [dbo].[STATE_EDI_DESCR] (
    [subValueId]       VARCHAR (255) NOT NULL,
    [STATE_EDI_GRP_ID] VARCHAR (255) NULL,
    [DESCRIPTION]      VARCHAR (30)  NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STATE_EDI_STATE_EDI_45241]
    ON [dbo].[STATE_EDI_DESCR]([STATE_EDI_GRP_ID] ASC);
