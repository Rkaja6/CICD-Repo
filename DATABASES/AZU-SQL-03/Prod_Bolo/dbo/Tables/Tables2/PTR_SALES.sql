CREATE TABLE [dbo].[PTR_SALES] (
    [PTR_SALES_ID]        VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [SALES_REPS]          VARCHAR (5)   NULL,
    [SALES_REP_EFF_DATES] DATETIME      NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PTR_SALES_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTR_SALES_u2_id_in]
    ON [dbo].[PTR_SALES]([u2_id] ASC);

