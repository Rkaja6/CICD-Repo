CREATE TABLE [dbo].[BANK_INFO_RMK] (
    [BANK_INFO_RMK_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [REMARKS]          VARCHAR (49)  NULL,
    [REMARK_DATES]     DATETIME      NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([BANK_INFO_RMK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [BANK_INFO_RMK_u2_id_in]
    ON [dbo].[BANK_INFO_RMK]([u2_id] ASC);

