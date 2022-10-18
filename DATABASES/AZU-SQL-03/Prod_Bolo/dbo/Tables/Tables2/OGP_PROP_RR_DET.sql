CREATE TABLE [dbo].[OGP_PROP_RR_DET] (
    [subValueId]            VARCHAR (255) NOT NULL,
    [OGP_PROP_RR_EFF_DT_ID] VARCHAR (255) NULL,
    [CONTRACTS]             VARCHAR (8)   NULL,
    [GPT_REQ_FLAGS]         VARCHAR (5)   NULL,
    [MPW_REQ_FLAGS]         VARCHAR (5)   NULL,
    [OCCVOL_REQ_FLAGS]      VARCHAR (5)   NULL,
    [OPCODES]               VARCHAR (8)   NULL,
    [OPERATORS]             VARCHAR (9)   NULL,
    [OTCVOL_REQ_FLAGS]      VARCHAR (5)   NULL,
    [PROPERTIES]            VARCHAR (15)  NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_PROP__OGP_PROP__59047]
    ON [dbo].[OGP_PROP_RR_DET]([OGP_PROP_RR_EFF_DT_ID] ASC);

