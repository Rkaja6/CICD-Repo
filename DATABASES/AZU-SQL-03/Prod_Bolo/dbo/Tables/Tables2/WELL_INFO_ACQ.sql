﻿CREATE TABLE [dbo].[WELL_INFO_ACQ] (
    [WELL_INFO_ACQ_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [ACQUISITION]      VARCHAR (11)  NULL,
    [ACQUISITION_DATE] DATETIME      NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([WELL_INFO_ACQ_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_INFO_ACQ_u2_id_in]
    ON [dbo].[WELL_INFO_ACQ]([u2_id] ASC);

