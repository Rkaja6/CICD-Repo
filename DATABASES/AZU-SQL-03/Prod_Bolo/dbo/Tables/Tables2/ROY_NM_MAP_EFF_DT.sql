CREATE TABLE [dbo].[ROY_NM_MAP_EFF_DT] (
    [ROY_NM_MAP_EFF_DT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                VARCHAR (255)   NULL,
    [ARMS_LENGTHS]         VARCHAR (4)     NULL,
    [EFF_DATES]            DATETIME        NULL,
    [EXP_DATES]            DATETIME        NULL,
    [IMPUTED_ROY_DECIMALS] NUMERIC (19, 8) NULL,
    [STATE_PRODUCTS]       VARCHAR (5)     NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([ROY_NM_MAP_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ROY_NM_MAP_EFF_DT_u2_id_in]
    ON [dbo].[ROY_NM_MAP_EFF_DT]([u2_id] ASC);

