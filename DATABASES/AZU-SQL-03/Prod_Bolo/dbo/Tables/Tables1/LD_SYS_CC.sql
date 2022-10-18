CREATE TABLE [dbo].[LD_SYS_CC] (
    [LD_SYS_CC_ID]            VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [MDECK_COST_CENTER_TYPES] VARCHAR (11)  NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LD_SYS_CC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LD_SYS_CC_u2_id_in]
    ON [dbo].[LD_SYS_CC]([u2_id] ASC);

