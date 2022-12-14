CREATE TABLE [dbo].[CHECK_BWT] (
    [CHECK_BWT_ID]            VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [BANK_WIRE_TRANSFER_DATE] DATETIME      NULL,
    [BANK_WIRE_TRANSFER_NO]   VARCHAR (22)  NULL,
    [BANK_WIRE_TRANSFER_USER] VARCHAR (5)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CHECK_BWT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CHECK_BWT_u2_id_in]
    ON [dbo].[CHECK_BWT]([u2_id] ASC);

