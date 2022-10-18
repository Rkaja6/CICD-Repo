CREATE TABLE [dbo].[CUST_NET_CC] (
    [CUST_NET_CC_ID]             VARCHAR (255) NOT NULL,
    [u2_id]                      VARCHAR (255) NULL,
    [EXC_NET_COST_CENTERS]       VARCHAR (11)  NULL,
    [NET_AFE_FLAGS]              VARCHAR (4)   NULL,
    [NET_AR_FLAGS]               VARCHAR (5)   NULL,
    [NET_COST_CENTER_FLAGS]      VARCHAR (4)   NULL,
    [NET_THIS_COST_CENTER_FLAGS] VARCHAR (6)   NULL,
    [time_stamp]                 DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CUST_NET_CC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CUST_NET_CC_u2_id_in]
    ON [dbo].[CUST_NET_CC]([u2_id] ASC);

