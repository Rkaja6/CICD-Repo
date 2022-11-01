﻿CREATE TABLE [dbo].[PRR_WY_EFF_DT] (
    [PRR_WY_EFF_DT_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [DISPOSAL_CODES]   VARCHAR (8)   NULL,
    [EFF_DATES]        DATETIME      NULL,
    [EXP_DATES]        DATETIME      NULL,
    [INJECTION_CODES]  VARCHAR (4)   NULL,
    [RESERVOIR_CODES]  VARCHAR (4)   NULL,
    [RRC_GAS_IDS]      VARCHAR (3)   NULL,
    [SIDE_TRACK_CODES] VARCHAR (3)   NULL,
    [STATUS]           VARCHAR (6)   NULL,
    [WELL_TYPES]       VARCHAR (5)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRR_WY_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRR_WY_EFF_DT_u2_id_in]
    ON [dbo].[PRR_WY_EFF_DT]([u2_id] ASC);
