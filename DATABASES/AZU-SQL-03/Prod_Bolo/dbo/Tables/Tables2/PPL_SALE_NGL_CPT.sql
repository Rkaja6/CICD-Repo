CREATE TABLE [dbo].[PPL_SALE_NGL_CPT] (
    [PPL_SALE_NGL_CPT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]               VARCHAR (255)   NULL,
    [ALLOCATED_AMTS]      NUMERIC (19, 2) NULL,
    [CPTS]                VARCHAR (10)    NULL,
    [CPT_AMTS]            NUMERIC (19, 2) NULL,
    [CPT_NET_FLAGS]       VARCHAR (4)     NULL,
    [time_stamp]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PPL_SALE_NGL_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PPL_SALE_NGL_CPT_u2_id_in]
    ON [dbo].[PPL_SALE_NGL_CPT]([u2_id] ASC);

