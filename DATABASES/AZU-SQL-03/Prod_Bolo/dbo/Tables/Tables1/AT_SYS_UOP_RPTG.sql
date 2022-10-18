﻿CREATE TABLE [dbo].[AT_SYS_UOP_RPTG] (
    [AT_SYS_UOP_RPTG_ID]       VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [UOP_DDA_RATE_RPTG_LEVELS] VARCHAR (12)  NULL,
    [UOP_PERSPECTIVES]         VARCHAR (5)   NULL,
    [UOP_RPTG_HIERARCHIES]     VARCHAR (9)   NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AT_SYS_UOP_RPTG_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_SYS_UOP_RPTG_u2_id_in]
    ON [dbo].[AT_SYS_UOP_RPTG]([u2_id] ASC);

