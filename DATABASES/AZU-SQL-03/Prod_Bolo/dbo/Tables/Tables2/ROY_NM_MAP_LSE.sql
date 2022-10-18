CREATE TABLE [dbo].[ROY_NM_MAP_LSE] (
    [subValueId]           VARCHAR (255)   NOT NULL,
    [ROY_NM_MAP_EFF_DT_ID] VARCHAR (255)   NULL,
    [ALLOC_DECIMALS]       NUMERIC (19, 8) NULL,
    [LEASES]               VARCHAR (6)     NULL,
    [PUNS]                 VARCHAR (7)     NULL,
    [ROYALTY_DECIMALS]     NUMERIC (19, 8) NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ROY_NM_MA_ROY_NM_MA_64577]
    ON [dbo].[ROY_NM_MAP_LSE]([ROY_NM_MAP_EFF_DT_ID] ASC);

