﻿CREATE TABLE [dbo].[CN_SYS_EXC_VOU] (
    [CN_SYS_EXC_VOU_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [EXC_VOU_TYPE]      VARCHAR (6)   NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CN_SYS_EXC_VOU_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CN_SYS_EXC_VOU_u2_id_in]
    ON [dbo].[CN_SYS_EXC_VOU]([u2_id] ASC);
