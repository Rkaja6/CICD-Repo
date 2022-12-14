CREATE TABLE [dbo].[PPL_STMT_CTRC] (
    [PPL_STMT_CTRC_ID]             VARCHAR (255)  NOT NULL,
    [u2_id]                        VARCHAR (255)  NULL,
    [CONTRACTS]                    VARCHAR (9)    NULL,
    [CONTRACT_ADJ_BTU_FACTOR]      VARCHAR (10)   NULL,
    [CONTRACT_ADJ_MEAS_PROD_VOLS]  VARCHAR (10)   NULL,
    [CONTRACT_ADJ_SCHED_PROD_VOLS] VARCHAR (10)   NULL,
    [CONTRACT_MEAS_PROD_VOLS]      VARCHAR (10)   NULL,
    [CONTRACT_MEAS_STMT_VOLS]      VARCHAR (10)   NULL,
    [CONTRACT_SCHED_PROD_VOLS]     VARCHAR (10)   NULL,
    [CONTRACT_SCHED_STMT_VOLS]     VARCHAR (10)   NULL,
    [ENTX_GRAVITY]                 NUMERIC (9, 1) NULL,
    [time_stamp]                   DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([PPL_STMT_CTRC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PPL_STMT_CTRC_u2_id_in]
    ON [dbo].[PPL_STMT_CTRC]([u2_id] ASC);

