﻿CREATE TABLE [dbo].[PAY_CODE_CHANGE_SPAY] (
    [PAY_CODE_CHANGE_SPAY_ID] VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [SOURCE_PAY_CODES]        VARCHAR (5)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PAY_CODE_CHANGE_SPAY_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PAY_CODE_CHANGE_SPAY_u2_id_in]
    ON [dbo].[PAY_CODE_CHANGE_SPAY]([u2_id] ASC);
