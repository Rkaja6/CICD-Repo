CREATE TABLE [dbo].[GAS_ANALYSIS_EQUIPS] (
    [GAS_ANALYSIS_EQUIPS_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [EQUIP_ID]               VARCHAR (6)   NULL,
    [EQUIP_TYPE]             VARCHAR (6)   NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([GAS_ANALYSIS_EQUIPS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GAS_ANALYSIS_EQUIPS_u2_id_in]
    ON [dbo].[GAS_ANALYSIS_EQUIPS]([u2_id] ASC);

