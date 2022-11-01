﻿CREATE TABLE [dbo].[LEASE_LEGALDESC] (
    [LEASE_LEGALDESC_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [LEGAL_DESC_XREF]    VARCHAR (20)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LEASE_LEGALDESC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LEASE_LEGALDESC_u2_id_in]
    ON [dbo].[LEASE_LEGALDESC]([u2_id] ASC);
