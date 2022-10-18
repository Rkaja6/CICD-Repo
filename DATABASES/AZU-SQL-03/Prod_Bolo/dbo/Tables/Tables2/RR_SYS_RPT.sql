CREATE TABLE [dbo].[RR_SYS_RPT] (
    [RR_SYS_RPT_ID] VARCHAR (255) NOT NULL,
    [u2_id]         VARCHAR (255) NULL,
    [GRP_ASC]       VARCHAR (4)   NULL,
    [RPT_CPTS]      VARCHAR (5)   NULL,
    [time_stamp]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RR_SYS_RPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_SYS_RPT_u2_id_in]
    ON [dbo].[RR_SYS_RPT]([u2_id] ASC);

