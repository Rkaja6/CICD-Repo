CREATE TABLE [dbo].[METER_EFF_DATE] (
    [METER_EFF_DATE_ID]   VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [DISP]                VARCHAR (11)  NULL,
    [EFF_DATES]           DATETIME      NULL,
    [HOW_MEASURED]        VARCHAR (8)   NULL,
    [HOW_USED]            VARCHAR (4)   NULL,
    [ORIFICE_PLATE]       VARCHAR (7)   NULL,
    [PRESSURE_BASE]       VARCHAR (7)   NULL,
    [PRODUCT]             VARCHAR (7)   NULL,
    [STATUS]              VARCHAR (6)   NULL,
    [TEMP_CORRECTED_FLAG] VARCHAR (11)  NULL,
    [TYPE]                VARCHAR (4)   NULL,
    [WET_DRY_FLAG]        VARCHAR (3)   NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([METER_EFF_DATE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [METER_EFF_DATE_u2_id_in]
    ON [dbo].[METER_EFF_DATE]([u2_id] ASC);

