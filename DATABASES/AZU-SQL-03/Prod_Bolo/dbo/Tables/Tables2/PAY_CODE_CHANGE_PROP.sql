﻿CREATE TABLE [dbo].[PAY_CODE_CHANGE_PROP] (
    [PAY_CODE_CHANGE_PROP_ID] VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [PROPERTIES]              VARCHAR (10)  NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PAY_CODE_CHANGE_PROP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PAY_CODE_CHANGE_PROP_u2_id_in]
    ON [dbo].[PAY_CODE_CHANGE_PROP]([u2_id] ASC);

