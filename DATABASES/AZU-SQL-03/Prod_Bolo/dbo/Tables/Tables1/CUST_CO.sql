CREATE TABLE [dbo].[CUST_CO] (
    [CUST_CO_ID]      VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [DFLT_TERMS]      VARCHAR (6)   NULL,
    [VALID_COMPANIES] VARCHAR (5)   NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CUST_CO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CUST_CO_u2_id_in]
    ON [dbo].[CUST_CO]([u2_id] ASC);

