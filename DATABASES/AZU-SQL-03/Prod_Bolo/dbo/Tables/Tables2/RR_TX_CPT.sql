CREATE TABLE [dbo].[RR_TX_CPT] (
    [RR_TX_CPT_ID] VARCHAR (255) NOT NULL,
    [u2_id]        VARCHAR (255) NULL,
    [CPTS]         VARCHAR (6)   NULL,
    [PRODUCTS]     VARCHAR (3)   NULL,
    [time_stamp]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RR_TX_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_TX_CPT_u2_id_in]
    ON [dbo].[RR_TX_CPT]([u2_id] ASC);

