﻿CREATE TABLE [dbo].[POR_WELL_FM_CODE] (
    [POR_WELL_FM_CODE_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [EFF_DATES]           DATETIME      NULL,
    [FORM_CODES]          VARCHAR (10)  NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([POR_WELL_FM_CODE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [POR_WELL_FM_CODE_u2_id_in]
    ON [dbo].[POR_WELL_FM_CODE]([u2_id] ASC);
