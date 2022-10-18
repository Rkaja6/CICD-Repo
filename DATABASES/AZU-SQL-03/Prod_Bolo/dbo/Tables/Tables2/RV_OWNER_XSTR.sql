﻿CREATE TABLE [dbo].[RV_OWNER_XSTR] (
    [RV_OWNER_XSTR_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [XREF_STRING]      VARCHAR (31)  NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RV_OWNER_XSTR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RV_OWNER_XSTR_u2_id_in]
    ON [dbo].[RV_OWNER_XSTR]([u2_id] ASC);

