﻿CREATE TABLE [dbo].[REMIT_FMT_CPT] (
    [REMIT_FMT_CPT_ID]   VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [CPTS]               VARCHAR (6)   NULL,
    [DISCRETE_CPT_FLAGS] VARCHAR (8)   NULL,
    [RPTG_BASIS]         VARCHAR (5)   NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([REMIT_FMT_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [REMIT_FMT_CPT_u2_id_in]
    ON [dbo].[REMIT_FMT_CPT]([u2_id] ASC);

