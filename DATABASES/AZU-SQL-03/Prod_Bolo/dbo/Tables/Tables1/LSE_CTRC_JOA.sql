﻿CREATE TABLE [dbo].[LSE_CTRC_JOA] (
    [LSE_CTRC_JOA_ID] VARCHAR (255)  NOT NULL,
    [u2_id]           VARCHAR (255)  NULL,
    [JOA_PROV_DATES]  DATETIME       NULL,
    [JOA_PROV_DESCS]  VARCHAR (1292) NULL,
    [JOA_PROV_TYPES]  VARCHAR (10)   NULL,
    [time_stamp]      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([LSE_CTRC_JOA_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LSE_CTRC_JOA_u2_id_in]
    ON [dbo].[LSE_CTRC_JOA]([u2_id] ASC);

