﻿CREATE TABLE [dbo].[ROY_NM_SYS_MKTG_CPT] (
    [ROY_NM_SYS_MKTG_CPT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [MKTG_CPTS]              VARCHAR (5)   NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([ROY_NM_SYS_MKTG_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ROY_NM_SYS_MKTG_CPT_u2_id_in]
    ON [dbo].[ROY_NM_SYS_MKTG_CPT]([u2_id] ASC);

