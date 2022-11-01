﻿CREATE TABLE [dbo].[FIN_RPT_FMT_SEL] (
    [FIN_RPT_FMT_SEL_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [SELECTION_CRITERIA] VARCHAR (125) NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([FIN_RPT_FMT_SEL_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [FIN_RPT_FMT_SEL_u2_id_in]
    ON [dbo].[FIN_RPT_FMT_SEL]([u2_id] ASC);
