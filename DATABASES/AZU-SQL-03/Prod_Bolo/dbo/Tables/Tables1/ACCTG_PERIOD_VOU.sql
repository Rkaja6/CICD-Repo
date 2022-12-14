CREATE TABLE [dbo].[ACCTG_PERIOD_VOU] (
    [subValueId]              VARCHAR (255) NOT NULL,
    [ACCTG_PERIOD_SUB_SYS_ID] VARCHAR (255) NULL,
    [EXC_APPS]                VARCHAR (10)  NULL,
    [EXC_VOU_SRCS]            VARCHAR (8)   NULL,
    [VOU_CLOSE_DATES]         DATETIME      NULL,
    [VOU_OPEN_DATES]          DATETIME      NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ACCTG_PER_ACCTG_PER_47554]
    ON [dbo].[ACCTG_PERIOD_VOU]([ACCTG_PERIOD_SUB_SYS_ID] ASC);

