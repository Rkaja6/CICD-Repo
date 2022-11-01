﻿CREATE TABLE [dbo].[PROD_MO_GATHERING_SYSTEMS] (
    [PROD_MO_GATHERING_SYSTEMS_ID] VARCHAR (255) NOT NULL,
    [u2_id]                        VARCHAR (255) NULL,
    [GATHERING_SYSTEMS]            VARCHAR (12)  NULL,
    [time_stamp]                   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PROD_MO_GATHERING_SYSTEMS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_MO_G_u2_id_27276]
    ON [dbo].[PROD_MO_GATHERING_SYSTEMS]([u2_id] ASC);
