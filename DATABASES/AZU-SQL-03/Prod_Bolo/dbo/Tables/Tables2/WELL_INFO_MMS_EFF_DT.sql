CREATE TABLE [dbo].[WELL_INFO_MMS_EFF_DT] (
    [subValueId]           VARCHAR (255)   NOT NULL,
    [WELL_INFO_MMS_AID_ID] VARCHAR (255)   NULL,
    [ACRE_DECIMALS]        NUMERIC (19, 8) NULL,
    [EFF_DATES]            DATETIME        NULL,
    [EXP_DATES]            DATETIME        NULL,
    [ROY_DECIMALS]         NUMERIC (19, 8) NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_INFO_WELL_INFO_81028]
    ON [dbo].[WELL_INFO_MMS_EFF_DT]([WELL_INFO_MMS_AID_ID] ASC);

