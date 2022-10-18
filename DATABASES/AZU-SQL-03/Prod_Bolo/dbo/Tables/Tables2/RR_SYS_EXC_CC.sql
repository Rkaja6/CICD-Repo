﻿CREATE TABLE [dbo].[RR_SYS_EXC_CC] (
    [RR_SYS_EXC_CC_ID]   VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [EXCLUSION_CC_TYPES] VARCHAR (3)   NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RR_SYS_EXC_CC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_SYS_EXC_CC_u2_id_in]
    ON [dbo].[RR_SYS_EXC_CC]([u2_id] ASC);

