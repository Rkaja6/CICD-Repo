﻿CREATE TABLE [dbo].[LEASE_TRACT_INDEX] (
    [LEASE_TRACT_INDEX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [TRACT_INDEX]          VARCHAR (10)  NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LEASE_TRACT_INDEX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LEASE_TRACT_INDEX_u2_id_in]
    ON [dbo].[LEASE_TRACT_INDEX]([u2_id] ASC);
