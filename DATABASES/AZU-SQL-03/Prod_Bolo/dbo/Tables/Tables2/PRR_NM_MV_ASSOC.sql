CREATE TABLE [dbo].[PRR_NM_MV_ASSOC] (
    [PRR_NM_MV_ASSOC_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [EFF_DATES]          DATETIME      NULL,
    [EXP_DATES]          DATETIME      NULL,
    [GAS_POD]            VARCHAR (9)   NULL,
    [PROPERTIES]         VARCHAR (8)   NULL,
    [WATER_POD]          VARCHAR (9)   NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRR_NM_MV_ASSOC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRR_NM_MV_ASSOC_u2_id_in]
    ON [dbo].[PRR_NM_MV_ASSOC]([u2_id] ASC);

