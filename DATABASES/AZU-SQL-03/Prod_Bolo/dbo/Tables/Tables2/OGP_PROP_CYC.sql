﻿CREATE TABLE [dbo].[OGP_PROP_CYC] (
    [OGP_PROP_CYC_ID]    VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [CYCLE_CHANGE_DATES] DATETIME      NULL,
    [CYCLE_CHANGE_USERS] VARCHAR (9)   NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OGP_PROP_CYC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_PROP_CYC_u2_id_in]
    ON [dbo].[OGP_PROP_CYC]([u2_id] ASC);
