﻿CREATE TABLE [dbo].[TRANS_CAT_PERSP] (
    [TRANS_CAT_PERSP_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [ACCTG_PERSPECTIVES] VARCHAR (5)   NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([TRANS_CAT_PERSP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRANS_CAT_PERSP_u2_id_in]
    ON [dbo].[TRANS_CAT_PERSP]([u2_id] ASC);

