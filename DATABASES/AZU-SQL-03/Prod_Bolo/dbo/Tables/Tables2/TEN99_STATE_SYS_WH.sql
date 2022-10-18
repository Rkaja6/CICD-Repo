﻿CREATE TABLE [dbo].[TEN99_STATE_SYS_WH] (
    [TEN99_STATE_SYS_WH_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                 VARCHAR (255)   NULL,
    [WH_EFF_DATES]          DATETIME        NULL,
    [WH_ENTITY_TYPES]       VARCHAR (3)     NULL,
    [WH_RATES]              NUMERIC (19, 8) NULL,
    [WH_RESIDENT_FLAGS]     VARCHAR (3)     NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([TEN99_STATE_SYS_WH_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TEN99_STATE_SYS_WH_u2_id_in]
    ON [dbo].[TEN99_STATE_SYS_WH]([u2_id] ASC);

