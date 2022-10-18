CREATE TABLE [Upstream].[UV_PEAK_PROD_AT] (
    [UWI]           VARCHAR (20)  NOT NULL,
    [PeakProdDate]  DATETIME2 (7) NULL,
    [FirstProdDate] DATETIME2 (7) NULL,
    [boe_1m]        DECIMAL (38)  NULL,
    [gas_1m]        DECIMAL (38)  NULL,
    [liq_1m]        DECIMAL (38)  NULL,
    [water_1m]      DECIMAL (38)  NULL,
    [boe_3m]        DECIMAL (38)  NULL,
    [gas_3m]        DECIMAL (38)  NULL,
    [liq_3m]        DECIMAL (38)  NULL,
    [water_3m]      DECIMAL (38)  NULL,
    [boe_6m]        DECIMAL (38)  NULL,
    [gas_6m]        DECIMAL (38)  NULL,
    [liq_6m]        DECIMAL (38)  NULL,
    [water_6m]      DECIMAL (38)  NULL,
    [boe_12m]       DECIMAL (38)  NULL,
    [gas_12m]       DECIMAL (38)  NULL,
    [liq_12m]       DECIMAL (38)  NULL,
    [water_12m]     DECIMAL (38)  NULL,
    CONSTRAINT [PK_UV_PEAK_PROD_AT] PRIMARY KEY CLUSTERED ([UWI] ASC)
);

