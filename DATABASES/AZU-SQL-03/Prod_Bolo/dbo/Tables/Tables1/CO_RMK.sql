﻿CREATE TABLE [dbo].[CO_RMK] (
    [CO_RMK_ID]   VARCHAR (255) NOT NULL,
    [u2_id]       VARCHAR (255) NULL,
    [REMARKS]     VARCHAR (75)  NULL,
    [REMARK_DATE] DATETIME      NULL,
    [time_stamp]  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CO_RMK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CO_RMK_u2_id_in]
    ON [dbo].[CO_RMK]([u2_id] ASC);

