﻿CREATE TABLE [dbo].[CN_SYS_ATLD] (
    [CN_SYS_ATLD_ID] VARCHAR (255) NOT NULL,
    [u2_id]          VARCHAR (255) NULL,
    [time_stamp]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CN_SYS_ATLD_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CN_SYS_ATLD_u2_id_in]
    ON [dbo].[CN_SYS_ATLD]([u2_id] ASC);

