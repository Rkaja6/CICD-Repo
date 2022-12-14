CREATE TABLE [dbo].[OWNER_SALE_REVALUE_STATUS] (
    [OWNER_SALE_REVALUE_STATUS_ID] VARCHAR (255) NOT NULL,
    [u2_id]                        VARCHAR (255) NULL,
    [REVALUE_STATUS]               VARCHAR (7)   NULL,
    [time_stamp]                   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OWNER_SALE_REVALUE_STATUS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OWNER_SAL_u2_id_2560]
    ON [dbo].[OWNER_SALE_REVALUE_STATUS]([u2_id] ASC);

