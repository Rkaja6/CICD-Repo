﻿CREATE TABLE [dbo].[MDECK_RI_ENTERED_PRODUCTS] (
    [subValueId]  VARCHAR (255)   NOT NULL,
    [MDECK_RI_ID] VARCHAR (255)   NULL,
    [ROYALTIES]   NUMERIC (19, 8) NULL,
    [time_stamp]  DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MDECK_RI__MDECK_RI__18043]
    ON [dbo].[MDECK_RI_ENTERED_PRODUCTS]([MDECK_RI_ID] ASC);
