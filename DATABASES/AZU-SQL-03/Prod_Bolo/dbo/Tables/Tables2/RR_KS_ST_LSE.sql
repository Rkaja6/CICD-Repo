CREATE TABLE [dbo].[RR_KS_ST_LSE] (
    [RR_KS_ST_LSE_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [EXEMPT_TYPE]     VARCHAR (6)   NULL,
    [LSE_EFF_DATES]   DATETIME      NULL,
    [TAXPAYER]        VARCHAR (9)   NULL,
    [TAX_DUE]         VARCHAR (3)   NULL,
    [WELL_TYPE]       VARCHAR (4)   NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RR_KS_ST_LSE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_KS_ST_LSE_u2_id_in]
    ON [dbo].[RR_KS_ST_LSE]([u2_id] ASC);

