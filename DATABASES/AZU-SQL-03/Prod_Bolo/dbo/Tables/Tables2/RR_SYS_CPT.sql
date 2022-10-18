CREATE TABLE [dbo].[RR_SYS_CPT] (
    [RR_SYS_CPT_ID]           VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [ADV_CPTS]                VARCHAR (6)   NULL,
    [COMPANY_VALUE_MODIFIERS] VARCHAR (7)   NULL,
    [CONS_CPTS]               VARCHAR (6)   NULL,
    [EXC_CPTS]                VARCHAR (6)   NULL,
    [FEE_CPTS]                VARCHAR (6)   NULL,
    [PROD_CPTS]               VARCHAR (4)   NULL,
    [SCH_CPTS]                VARCHAR (6)   NULL,
    [SEV_CPTS]                VARCHAR (6)   NULL,
    [TRANS_CPTS]              VARCHAR (5)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RR_SYS_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_SYS_CPT_u2_id_in]
    ON [dbo].[RR_SYS_CPT]([u2_id] ASC);

