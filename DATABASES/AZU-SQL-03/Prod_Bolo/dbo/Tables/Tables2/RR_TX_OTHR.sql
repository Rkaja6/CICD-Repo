CREATE TABLE [dbo].[RR_TX_OTHR] (
    [RR_TX_OTHR_ID]       VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [OTHER_PTY_EFF_DATES] DATETIME      NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RR_TX_OTHR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_TX_OTHR_u2_id_in]
    ON [dbo].[RR_TX_OTHR]([u2_id] ASC);

