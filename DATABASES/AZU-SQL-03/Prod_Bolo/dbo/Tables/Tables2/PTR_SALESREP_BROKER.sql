CREATE TABLE [dbo].[PTR_SALESREP_BROKER] (
    [PTR_SALESREP_BROKER_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [BROKERS]                VARCHAR (9)   NULL,
    [BROKER_EFF_DATES]       VARCHAR (9)   NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PTR_SALESREP_BROKER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTR_SALESREP_BROKER_u2_id_in]
    ON [dbo].[PTR_SALESREP_BROKER]([u2_id] ASC);

