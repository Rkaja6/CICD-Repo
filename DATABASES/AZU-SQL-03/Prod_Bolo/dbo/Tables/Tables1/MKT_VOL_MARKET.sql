CREATE TABLE [dbo].[MKT_VOL_MARKET] (
    [subValueId]                 VARCHAR (255)   NOT NULL,
    [MKT_VOL_WI_ID]              VARCHAR (255)   NULL,
    [ACTUAL_MARKET_INTERESTS]    NUMERIC (19, 8) NULL,
    [ASSIGN_OWNERS]              VARCHAR (13)    NULL,
    [COMMITTED_FLAGS]            VARCHAR (9)     NULL,
    [DELIVERED_MCFS]             NUMERIC (19, 2) NULL,
    [DELIVERED_MMBTUS]           NUMERIC (19, 2) NULL,
    [ESTIMATED_MARKET_INTERESTS] NUMERIC (19, 8) NULL,
    [MARKETS]                    VARCHAR (12)    NULL,
    [NOMINATED_MMBTUS]           NUMERIC (19, 2) NULL,
    [OWN_ASSIGN_INDEX]           VARCHAR (16)    NULL,
    [time_stamp]                 DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MKT_VOL_M_MKT_VOL_W_48220]
    ON [dbo].[MKT_VOL_MARKET]([MKT_VOL_WI_ID] ASC);

