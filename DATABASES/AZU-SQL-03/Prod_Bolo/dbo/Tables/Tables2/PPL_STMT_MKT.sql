CREATE TABLE [dbo].[PPL_STMT_MKT] (
    [PPL_STMT_MKT_ID]  VARCHAR (255)   NOT NULL,
    [u2_id]            VARCHAR (255)   NULL,
    [DELIVERED_MMBTUS] NUMERIC (19, 2) NULL,
    [DISBURSE_FLAGS]   VARCHAR (8)     NULL,
    [MARKETS]          VARCHAR (6)     NULL,
    [MEASURED_MCFS]    NUMERIC (19, 2) NULL,
    [MEASURED_MMBTUS]  NUMERIC (19, 2) NULL,
    [time_stamp]       DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PPL_STMT_MKT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PPL_STMT_MKT_u2_id_in]
    ON [dbo].[PPL_STMT_MKT]([u2_id] ASC);

