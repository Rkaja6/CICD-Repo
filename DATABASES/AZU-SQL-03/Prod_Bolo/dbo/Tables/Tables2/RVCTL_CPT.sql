﻿CREATE TABLE [dbo].[RVCTL_CPT] (
    [RVCTL_CPT_ID] VARCHAR (255) NOT NULL,
    [u2_id]        VARCHAR (255) NULL,
    [CPTS]         VARCHAR (6)   NULL,
    [time_stamp]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RVCTL_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RVCTL_CPT_u2_id_in]
    ON [dbo].[RVCTL_CPT]([u2_id] ASC);

