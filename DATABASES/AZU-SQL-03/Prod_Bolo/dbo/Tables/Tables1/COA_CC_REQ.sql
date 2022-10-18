CREATE TABLE [dbo].[COA_CC_REQ] (
    [COA_CC_REQ_ID] VARCHAR (255) NOT NULL,
    [u2_id]         VARCHAR (255) NULL,
    [CC_REQ]        VARCHAR (4)   NULL,
    [time_stamp]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([COA_CC_REQ_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [COA_CC_REQ_u2_id_in]
    ON [dbo].[COA_CC_REQ]([u2_id] ASC);

