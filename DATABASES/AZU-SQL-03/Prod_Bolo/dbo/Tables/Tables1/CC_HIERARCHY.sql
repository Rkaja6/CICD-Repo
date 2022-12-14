CREATE TABLE [dbo].[CC_HIERARCHY] (
    [CC_HIERARCHY_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [HIERARCHIES]     VARCHAR (7)   NULL,
    [LEVEL_CODES]     VARCHAR (15)  NULL,
    [ROLLUP_CCS]      VARCHAR (21)  NULL,
    [SUB_HIERARCHIES] VARCHAR (7)   NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CC_HIERARCHY_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_HIERARCHY_u2_id_in]
    ON [dbo].[CC_HIERARCHY]([u2_id] ASC);

