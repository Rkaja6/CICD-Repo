CREATE TABLE [dbo].[AR_ADJ_APLD] (
    [AR_ADJ_APLD_ID]         VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [APPLIED_CUSTOMER_INDEX] VARCHAR (12)  NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AR_ADJ_APLD_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AR_ADJ_APLD_u2_id_in]
    ON [dbo].[AR_ADJ_APLD]([u2_id] ASC);

