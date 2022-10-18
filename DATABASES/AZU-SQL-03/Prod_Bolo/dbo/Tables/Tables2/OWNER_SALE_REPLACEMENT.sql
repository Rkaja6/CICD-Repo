﻿CREATE TABLE [dbo].[OWNER_SALE_REPLACEMENT] (
    [OWNER_SALE_REPLACEMENT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                     VARCHAR (255) NULL,
    [REPLACEMENT_OWNERS]        VARCHAR (9)   NULL,
    [REPLACEMENT_OWNER_SALE_ID] VARCHAR (11)  NULL,
    [time_stamp]                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OWNER_SALE_REPLACEMENT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OWNER_SAL_u2_id_47330]
    ON [dbo].[OWNER_SALE_REPLACEMENT]([u2_id] ASC);

