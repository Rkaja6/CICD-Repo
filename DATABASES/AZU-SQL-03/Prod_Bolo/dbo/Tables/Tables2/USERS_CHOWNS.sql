﻿CREATE TABLE [dbo].[USERS_CHOWNS] (
    [USERS_CHOWNS_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [HOLD_CHOWNS]     VARCHAR (15)  NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([USERS_CHOWNS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [USERS_CHOWNS_u2_id_in]
    ON [dbo].[USERS_CHOWNS]([u2_id] ASC);

