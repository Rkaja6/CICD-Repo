﻿CREATE TABLE [dbo].[PPL_STMT_CTRC_NGL_IDX] (
    [PPL_STMT_CTRC_NGL_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [CTRC_VOL_NGL_INDEX]       VARCHAR (12)  NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PPL_STMT_CTRC_NGL_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PPL_STMT_CTRC_NGL_IDX_u2_id_in]
    ON [dbo].[PPL_STMT_CTRC_NGL_IDX]([u2_id] ASC);
