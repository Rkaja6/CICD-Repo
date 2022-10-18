CREATE TABLE [dbo].[OGP_PROP_MMS_DET] (
    [subValueId]             VARCHAR (255)   NOT NULL,
    [OGP_PROP_MMS_EFF_DT_ID] VARCHAR (255)   NULL,
    [AGREEMENT_NOS]          VARCHAR (11)    NULL,
    [AID_NOS]                VARCHAR (11)    NULL,
    [CONTRIB_DECIMALS]       NUMERIC (19, 8) NULL,
    [IF_FLAGS]               VARCHAR (3)     NULL,
    [INDEX_PRICE_METHODS]    VARCHAR (8)     NULL,
    [IND_TYPES]              VARCHAR (3)     NULL,
    [OMIT_2014]              VARCHAR (3)     NULL,
    [RIK_FLAG]               VARCHAR (3)     NULL,
    [ROY_RATES]              NUMERIC (19, 8) NULL,
    [SA_CALC_METHS]          VARCHAR (4)     NULL,
    [SA_CODES]               VARCHAR (4)     NULL,
    [TRANS_RIKCD]            VARCHAR (3)     NULL,
    [time_stamp]             DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_PROP__OGP_PROP__70360]
    ON [dbo].[OGP_PROP_MMS_DET]([OGP_PROP_MMS_EFF_DT_ID] ASC);

