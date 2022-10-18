﻿CREATE TABLE [dbo].[STATE_WTYPE_CPT] (
    [STATE_WTYPE_CPT_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [CPTS]               VARCHAR (6)   NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([STATE_WTYPE_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STATE_WTYPE_CPT_u2_id_in]
    ON [dbo].[STATE_WTYPE_CPT]([u2_id] ASC);

