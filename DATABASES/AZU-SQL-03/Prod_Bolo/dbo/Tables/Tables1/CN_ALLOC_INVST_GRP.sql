﻿CREATE TABLE [dbo].[CN_ALLOC_INVST_GRP] (
    [subValueId]         VARCHAR (255)   NOT NULL,
    [CN_ALLOC_EFF_DT_ID] VARCHAR (255)   NULL,
    [DCIMAL]             NUMERIC (19, 8) NULL,
    [INVEST_GRPS]        VARCHAR (5)     NULL,
    [TARGET_COMPANY]     VARCHAR (6)     NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CN_ALLOC__CN_ALLOC__59498]
    ON [dbo].[CN_ALLOC_INVST_GRP]([CN_ALLOC_EFF_DT_ID] ASC);

