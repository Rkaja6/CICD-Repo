CREATE TABLE [dbo].[CDX_CO_PAY] (
    [CDX_CO_PAY_ID] VARCHAR (255) NOT NULL,
    [u2_id]         VARCHAR (255) NULL,
    [ACTV_DTS]      DATETIME      NULL,
    [PAYEES]        VARCHAR (8)   NULL,
    [time_stamp]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CDX_CO_PAY_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CDX_CO_PAY_u2_id_in]
    ON [dbo].[CDX_CO_PAY]([u2_id] ASC);

