﻿CREATE TABLE [dbo].[PTRSHP_INVESTOR_REM] (
    [PTRSHP_INVESTOR_REM_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [REMARKS]                VARCHAR (25)  NULL,
    [REMARK_DATES]           DATETIME      NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PTRSHP_INVESTOR_REM_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTRSHP_INVESTOR_REM_u2_id_in]
    ON [dbo].[PTRSHP_INVESTOR_REM]([u2_id] ASC);
