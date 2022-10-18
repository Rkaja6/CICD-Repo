CREATE TABLE [dbo].[WELL_INFO_ENGINEER_EFF_DT] (
    [WELL_INFO_ENGINEER_EFF_DT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                        VARCHAR (255)   NULL,
    [CAPITAL]                      NUMERIC (19, 2) NULL,
    [ENGINEER_EFF_DATE]            DATETIME        NULL,
    [FORMATION]                    VARCHAR (20)    NULL,
    [PROD_INTERVALS]               VARCHAR (12)    NULL,
    [time_stamp]                   DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([WELL_INFO_ENGINEER_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_INFO_u2_id_16769]
    ON [dbo].[WELL_INFO_ENGINEER_EFF_DT]([u2_id] ASC);

