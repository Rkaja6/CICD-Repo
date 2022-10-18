CREATE TABLE [dbo].[OFP_PROP_ALLOC_PROP] (
    [subValueId]               VARCHAR (255)   NOT NULL,
    [OFP_PROP_ALLOC_EFF_DT_ID] VARCHAR (255)   NULL,
    [PERCENTS]                 NUMERIC (19, 6) NULL,
    [PROPERTIES]               VARCHAR (10)    NULL,
    [STMT_RPT_LEVEL]           VARCHAR (3)     NULL,
    [WEIGHTS]                  NUMERIC (19, 2) NULL,
    [time_stamp]               DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OFP_PROP__OFP_PROP__73518]
    ON [dbo].[OFP_PROP_ALLOC_PROP]([OFP_PROP_ALLOC_EFF_DT_ID] ASC);

