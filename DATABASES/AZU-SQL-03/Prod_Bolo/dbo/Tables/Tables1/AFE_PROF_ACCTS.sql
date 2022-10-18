﻿CREATE TABLE [dbo].[AFE_PROF_ACCTS] (
    [AFE_PROF_ACCTS_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [ACCTS]             VARCHAR (12)  NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AFE_PROF_ACCTS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AFE_PROF_ACCTS_u2_id_in]
    ON [dbo].[AFE_PROF_ACCTS]([u2_id] ASC);

