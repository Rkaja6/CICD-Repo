﻿CREATE TABLE [dbo].[OH_TYPE_CO] (
    [OH_TYPE_CO_ID] VARCHAR (255) NOT NULL,
    [u2_id]         VARCHAR (255) NULL,
    [COMPANIES]     VARCHAR (3)   NULL,
    [OFFSET_ACCTS]  VARCHAR (11)  NULL,
    [TARGET_ACCTS]  VARCHAR (11)  NULL,
    [time_stamp]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OH_TYPE_CO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OH_TYPE_CO_u2_id_in]
    ON [dbo].[OH_TYPE_CO]([u2_id] ASC);

