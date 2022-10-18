CREATE TABLE [dbo].[RV_SYS_CC_TP] (
    [RV_SYS_CC_TP_ID]       VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [DIV_COST_CENTER_TYPES] VARCHAR (11)  NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RV_SYS_CC_TP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RV_SYS_CC_TP_u2_id_in]
    ON [dbo].[RV_SYS_CC_TP]([u2_id] ASC);

