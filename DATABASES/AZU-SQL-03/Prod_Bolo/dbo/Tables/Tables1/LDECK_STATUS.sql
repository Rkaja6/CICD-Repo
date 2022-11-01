﻿CREATE TABLE [dbo].[LDECK_STATUS] (
    [subValueId]     VARCHAR (255) NOT NULL,
    [LDECK_SESS_ID]  VARCHAR (255) NULL,
    [SESSION_STATUS] VARCHAR (8)   NULL,
    [time_stamp]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LDECK_STATUS_LDECK_SESS_ID_in]
    ON [dbo].[LDECK_STATUS]([LDECK_SESS_ID] ASC);
