﻿CREATE TABLE [dbo].[RR_NM_CPT] (
    [RR_NM_CPT_ID] VARCHAR (255) NOT NULL,
    [u2_id]        VARCHAR (255) NULL,
    [EFF_DATES]    DATETIME      NULL,
    [time_stamp]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RR_NM_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_NM_CPT_u2_id_in]
    ON [dbo].[RR_NM_CPT]([u2_id] ASC);

