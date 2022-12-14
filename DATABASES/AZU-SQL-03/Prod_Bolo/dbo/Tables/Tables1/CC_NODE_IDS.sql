CREATE TABLE [dbo].[CC_NODE_IDS] (
    [subValueId]              VARCHAR (255) NOT NULL,
    [CC_PROD_UI_NODE_ID]      VARCHAR (255) NULL,
    [PRD_FAC_PRD_NODE_INDEX]  VARCHAR (15)  NULL,
    [PROD_FAC_PRD_NODE_INDEX] VARCHAR (15)  NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_NODE_I_CC_PROD_U_56680]
    ON [dbo].[CC_NODE_IDS]([CC_PROD_UI_NODE_ID] ASC);

