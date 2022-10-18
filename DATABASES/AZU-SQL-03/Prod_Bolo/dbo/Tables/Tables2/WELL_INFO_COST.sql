﻿CREATE TABLE [dbo].[WELL_INFO_COST] (
    [WELL_INFO_COST_ID] VARCHAR (255)   NOT NULL,
    [u2_id]             VARCHAR (255)   NULL,
    [ADVALOREM]         NUMERIC (19, 2) NULL,
    [ADVALOREM_PCT]     NUMERIC (19, 4) NULL,
    [COST_COMMENTS]     VARCHAR (47)    NULL,
    [COST_EFF_DATES]    DATETIME        NULL,
    [GROSS_REVENUES]    NUMERIC (19, 2) NULL,
    [LOE]               NUMERIC (19, 2) NULL,
    [REV_COMMENTS]      VARCHAR (46)    NULL,
    [time_stamp]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([WELL_INFO_COST_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_INFO_COST_u2_id_in]
    ON [dbo].[WELL_INFO_COST]([u2_id] ASC);

