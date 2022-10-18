﻿CREATE TABLE [dbo].[NAME_MODEM] (
    [NAME_MODEM_ID] VARCHAR (255) NOT NULL,
    [u2_id]         VARCHAR (255) NULL,
    [MODEMS]        VARCHAR (39)  NULL,
    [MODEM_COMMENT] VARCHAR (30)  NULL,
    [time_stamp]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([NAME_MODEM_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [NAME_MODEM_u2_id_in]
    ON [dbo].[NAME_MODEM]([u2_id] ASC);

