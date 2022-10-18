CREATE TABLE [dbo].[PROD_DAILY_THEO_SPLIT_NODE] (
    [PROD_DAILY_THEO_SPLIT_NODE_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                         VARCHAR (255)   NULL,
    [SPLIT_MMBTUS]                  NUMERIC (19, 2) NULL,
    [SPLIT_NODES]                   VARCHAR (10)    NULL,
    [SPLIT_VOLS]                    NUMERIC (19, 2) NULL,
    [time_stamp]                    DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PROD_DAILY_THEO_SPLIT_NODE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_DAIL_u2_id_12449]
    ON [dbo].[PROD_DAILY_THEO_SPLIT_NODE]([u2_id] ASC);

