﻿CREATE TABLE [dbo].[OWN_CHANGE_CC] (
    [OWN_CHANGE_CC_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [COST_CENTERS]     VARCHAR (10)  NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OWN_CHANGE_CC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OWN_CHANGE_CC_u2_id_in]
    ON [dbo].[OWN_CHANGE_CC]([u2_id] ASC);

