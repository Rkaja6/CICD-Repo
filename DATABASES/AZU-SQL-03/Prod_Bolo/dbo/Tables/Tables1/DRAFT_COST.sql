﻿CREATE TABLE [dbo].[DRAFT_COST] (
    [DRAFT_COST_ID] VARCHAR (255)   NOT NULL,
    [u2_id]         VARCHAR (255)   NULL,
    [COST_AMTS]     NUMERIC (19, 2) NULL,
    [COST_CATS]     VARCHAR (5)     NULL,
    [time_stamp]    DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([DRAFT_COST_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DRAFT_COST_u2_id_in]
    ON [dbo].[DRAFT_COST]([u2_id] ASC);
