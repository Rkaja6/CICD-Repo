﻿CREATE TABLE [dbo].[NAME_RMK] (
    [NAME_RMK_ID] VARCHAR (255) NOT NULL,
    [u2_id]       VARCHAR (255) NULL,
    [REMARKS]     VARCHAR (579) NULL,
    [REMARK_DATE] DATETIME      NULL,
    [time_stamp]  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([NAME_RMK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [NAME_RMK_u2_id_in]
    ON [dbo].[NAME_RMK]([u2_id] ASC);

