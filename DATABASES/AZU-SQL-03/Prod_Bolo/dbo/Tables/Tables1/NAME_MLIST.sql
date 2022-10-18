﻿CREATE TABLE [dbo].[NAME_MLIST] (
    [NAME_MLIST_ID] VARCHAR (255) NOT NULL,
    [u2_id]         VARCHAR (255) NULL,
    [MLIST_CODES]   VARCHAR (5)   NULL,
    [time_stamp]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([NAME_MLIST_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [NAME_MLIST_u2_id_in]
    ON [dbo].[NAME_MLIST]([u2_id] ASC);

