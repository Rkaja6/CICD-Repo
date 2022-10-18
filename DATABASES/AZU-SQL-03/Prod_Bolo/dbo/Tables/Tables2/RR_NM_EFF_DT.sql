CREATE TABLE [dbo].[RR_NM_EFF_DT] (
    [RR_NM_EFF_DT_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [AFFL_CODES]      VARCHAR (4)   NULL,
    [EXP_DATES]       DATETIME      NULL,
    [TAX_DUE]         VARCHAR (3)   NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RR_NM_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_NM_EFF_DT_u2_id_in]
    ON [dbo].[RR_NM_EFF_DT]([u2_id] ASC);

