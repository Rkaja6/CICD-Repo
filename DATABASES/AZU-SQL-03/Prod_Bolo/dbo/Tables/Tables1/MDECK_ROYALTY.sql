﻿CREATE TABLE [dbo].[MDECK_ROYALTY] (
    [MDECK_ROYALTY_ID]        VARCHAR (255)   NOT NULL,
    [u2_id]                   VARCHAR (255)   NULL,
    [ENTERED_PRODUCTS]        VARCHAR (7)     NULL,
    [TOTAL_ROYALTIES_ENTERED] NUMERIC (19, 8) NULL,
    [TOTAL_ROYALTY]           NUMERIC (19, 8) NULL,
    [time_stamp]              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([MDECK_ROYALTY_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MDECK_ROYALTY_u2_id_in]
    ON [dbo].[MDECK_ROYALTY]([u2_id] ASC);
