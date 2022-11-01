﻿CREATE TABLE [dbo].[OG_REG_RPT_EXCL] (
    [OG_REG_RPT_EXCL_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [EXCLUSION_CODE]     VARCHAR (4)   NULL,
    [EXCLUSION_VOLUME]   VARCHAR (6)   NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OG_REG_RPT_EXCL_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_REG_RPT_EXCL_u2_id_in]
    ON [dbo].[OG_REG_RPT_EXCL]([u2_id] ASC);
