CREATE TABLE [dbo].[OWNER_SALE_RR_POST] (
    [OWNER_SALE_RR_POST_ID] VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [RR_POST]               VARCHAR (3)   NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OWNER_SALE_RR_POST_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OWNER_SALE_RR_POST_u2_id_in]
    ON [dbo].[OWNER_SALE_RR_POST]([u2_id] ASC);

