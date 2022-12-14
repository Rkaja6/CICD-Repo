CREATE TABLE [dbo].[PPL_SALE_NGL_PROP_CPT] (
    [subValueId]           VARCHAR (255)   NOT NULL,
    [PPL_SALE_NGL_PROP_ID] VARCHAR (255)   NULL,
    [WELL_CPTS]            VARCHAR (8)     NULL,
    [WELL_CPT_AMTS]        NUMERIC (19, 2) NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PPL_SALE__PPL_SALE__69549]
    ON [dbo].[PPL_SALE_NGL_PROP_CPT]([PPL_SALE_NGL_PROP_ID] ASC);

