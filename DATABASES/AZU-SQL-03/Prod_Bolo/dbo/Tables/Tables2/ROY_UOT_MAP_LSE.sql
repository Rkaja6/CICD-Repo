CREATE TABLE [dbo].[ROY_UOT_MAP_LSE] (
    [ROY_UOT_MAP_LSE_ID] VARCHAR (255)   NOT NULL,
    [u2_id]              VARCHAR (255)   NULL,
    [DECIMALS]           NUMERIC (19, 8) NULL,
    [LEASES]             VARCHAR (12)    NULL,
    [RRC_NOS]            VARCHAR (6)     NULL,
    [TRACTS]             VARCHAR (5)     NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([ROY_UOT_MAP_LSE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ROY_UOT_MAP_LSE_u2_id_in]
    ON [dbo].[ROY_UOT_MAP_LSE]([u2_id] ASC);

