﻿CREATE TABLE [dbo].[PTRSHP_INVESTOR_YTD_DET] (
    [subValueId]                 VARCHAR (255)   NOT NULL,
    [PTRSHP_INVESTOR_YTD_PER_ID] VARCHAR (255)   NULL,
    [YTD_EXPENSES]               NUMERIC (19, 2) NULL,
    [YTD_REVENUES]               NUMERIC (19, 2) NULL,
    [YTD_VOLUMES]                NUMERIC (19, 2) NULL,
    [time_stamp]                 DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTRSHP_IN_PTRSHP_IN_88553]
    ON [dbo].[PTRSHP_INVESTOR_YTD_DET]([PTRSHP_INVESTOR_YTD_PER_ID] ASC);

