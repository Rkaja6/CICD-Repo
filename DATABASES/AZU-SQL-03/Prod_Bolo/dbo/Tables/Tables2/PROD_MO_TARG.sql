CREATE TABLE [dbo].[PROD_MO_TARG] (
    [PROD_MO_TARG_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [TARGET_IDS]      VARCHAR (25)  NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PROD_MO_TARG_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_MO_TARG_u2_id_in]
    ON [dbo].[PROD_MO_TARG]([u2_id] ASC);

