﻿CREATE TABLE [dbo].[LEASE_LINK] (
    [LEASE_LINK_ID] VARCHAR (255) NOT NULL,
    [u2_id]         VARCHAR (255) NULL,
    [IMAGE_REF]     VARCHAR (53)  NULL,
    [LINKS]         VARCHAR (53)  NULL,
    [LINK_TYPES]    VARCHAR (12)  NULL,
    [time_stamp]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LEASE_LINK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LEASE_LINK_u2_id_in]
    ON [dbo].[LEASE_LINK]([u2_id] ASC);
