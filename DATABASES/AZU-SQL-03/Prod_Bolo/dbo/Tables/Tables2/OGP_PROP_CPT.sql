CREATE TABLE [dbo].[OGP_PROP_CPT] (
    [OGP_PROP_CPT_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [CPTS]            VARCHAR (6)   NULL,
    [PRODUCTS]        VARCHAR (3)   NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OGP_PROP_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_PROP_CPT_u2_id_in]
    ON [dbo].[OGP_PROP_CPT]([u2_id] ASC);

