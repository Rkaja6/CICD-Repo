﻿CREATE TABLE [dbo].[PTRSHP_SYS_X_STR] (
    [PTRSHP_SYS_X_STR_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [XREF_STRING]         VARCHAR (30)  NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PTRSHP_SYS_X_STR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTRSHP_SYS_X_STR_u2_id_in]
    ON [dbo].[PTRSHP_SYS_X_STR]([u2_id] ASC);

