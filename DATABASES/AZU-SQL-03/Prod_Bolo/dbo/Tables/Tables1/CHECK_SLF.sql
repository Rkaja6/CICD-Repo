﻿CREATE TABLE [dbo].[CHECK_SLF] (
    [CHECK_SLF_ID] VARCHAR (255) NOT NULL,
    [u2_id]        VARCHAR (255) NULL,
    [SLF]          VARCHAR (12)  NULL,
    [time_stamp]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CHECK_SLF_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CHECK_SLF_u2_id_in]
    ON [dbo].[CHECK_SLF]([u2_id] ASC);

