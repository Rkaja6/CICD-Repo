CREATE TABLE [dbo].[PTD_CALC_METH] (
    [PTD_CALC_METH_ID]     VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [CALC_METHODS]         VARCHAR (6)   NULL,
    [METHOD_BEGIN_PERIODS] DATETIME      NULL,
    [METHOD_END_PERIODS]   DATETIME      NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PTD_CALC_METH_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTD_CALC_METH_u2_id_in]
    ON [dbo].[PTD_CALC_METH]([u2_id] ASC);

