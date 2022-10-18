﻿CREATE TABLE [dbo].[RV_OWNER_YTD] (
    [RV_OWNER_YTD_ID] VARCHAR (255)   NOT NULL,
    [u2_id]           VARCHAR (255)   NULL,
    [NO_YEARS]        VARCHAR (8)     NULL,
    [YTD_DEDUCTS]     NUMERIC (19, 2) NULL,
    [YTD_GROSS]       NUMERIC (19, 2) NULL,
    [YTD_TAXES]       NUMERIC (19, 2) NULL,
    [time_stamp]      DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([RV_OWNER_YTD_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RV_OWNER_YTD_u2_id_in]
    ON [dbo].[RV_OWNER_YTD]([u2_id] ASC);

