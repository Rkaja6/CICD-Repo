CREATE TABLE [dbo].[JB_SYS_BCCT] (
    [JB_SYS_BCCT_ID]            VARCHAR (255) NOT NULL,
    [u2_id]                     VARCHAR (255) NULL,
    [BILLING_COST_CENTER_TYPES] VARCHAR (12)  NULL,
    [time_stamp]                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([JB_SYS_BCCT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [JB_SYS_BCCT_u2_id_in]
    ON [dbo].[JB_SYS_BCCT]([u2_id] ASC);

