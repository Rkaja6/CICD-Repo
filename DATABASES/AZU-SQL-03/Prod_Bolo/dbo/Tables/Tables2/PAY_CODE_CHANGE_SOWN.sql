﻿CREATE TABLE [dbo].[PAY_CODE_CHANGE_SOWN] (
    [PAY_CODE_CHANGE_SOWN_ID] VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [SOURCE_OWNERS]           VARCHAR (9)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PAY_CODE_CHANGE_SOWN_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PAY_CODE_CHANGE_SOWN_u2_id_in]
    ON [dbo].[PAY_CODE_CHANGE_SOWN]([u2_id] ASC);

