CREATE TABLE [dbo].[WELL_INFO_SPC_OBL] (
    [WELL_INFO_SPC_OBL_ID] VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [SPC_OBL_DATES]        DATETIME      NULL,
    [SPC_OBL_DESCS]        VARCHAR (67)  NULL,
    [SPC_OBL_END_DATES]    DATETIME      NULL,
    [SPC_OBL_PERIODS]      VARCHAR (6)   NULL,
    [SPC_OBL_TYPES]        VARCHAR (4)   NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([WELL_INFO_SPC_OBL_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_INFO_SPC_OBL_u2_id_in]
    ON [dbo].[WELL_INFO_SPC_OBL]([u2_id] ASC);

