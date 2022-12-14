CREATE TABLE [dbo].[CC_HIER_ERR_CONFLICT] (
    [CC_HIER_ERR_CONFLICT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [CONFLICT_COST_CENTERS]   VARCHAR (10)  NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CC_HIER_ERR_CONFLICT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_HIER_ERR_CONFLICT_u2_id_in]
    ON [dbo].[CC_HIER_ERR_CONFLICT]([u2_id] ASC);

