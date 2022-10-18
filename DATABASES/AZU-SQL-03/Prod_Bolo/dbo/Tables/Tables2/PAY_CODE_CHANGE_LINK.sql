﻿CREATE TABLE [dbo].[PAY_CODE_CHANGE_LINK] (
    [PAY_CODE_CHANGE_LINK_ID] VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [LINKS]                   VARCHAR (20)  NULL,
    [LINK_TYPES]              VARCHAR (6)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PAY_CODE_CHANGE_LINK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PAY_CODE_CHANGE_LINK_u2_id_in]
    ON [dbo].[PAY_CODE_CHANGE_LINK]([u2_id] ASC);

