﻿CREATE TABLE [dbo].[WELL_VOL_MMBTU] (
    [subValueId]          VARCHAR (255)   NOT NULL,
    [WELL_VOL_SALE_DT_ID] VARCHAR (255)   NULL,
    [MMBTUS]              NUMERIC (19, 2) NULL,
    [time_stamp]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_VOL__WELL_VOL__15048]
    ON [dbo].[WELL_VOL_MMBTU]([WELL_VOL_SALE_DT_ID] ASC);

