﻿CREATE TABLE [dbo].[GL_OBUD_IDX] (
    [subValueId]           VARCHAR (255) NOT NULL,
    [GL_OBUD_ACCTG_PER_ID] VARCHAR (255) NULL,
    [ALLOC_GL_OBUD_INDEX]  VARCHAR (20)  NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GL_OBUD_I_GL_OBUD_A_82005]
    ON [dbo].[GL_OBUD_IDX]([GL_OBUD_ACCTG_PER_ID] ASC);

