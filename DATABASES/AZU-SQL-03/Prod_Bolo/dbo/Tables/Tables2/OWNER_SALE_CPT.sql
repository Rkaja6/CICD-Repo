CREATE TABLE [dbo].[OWNER_SALE_CPT] (
    [OWNER_SALE_CPT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]             VARCHAR (255)   NULL,
    [CNV_GROSS_CPT]     NUMERIC (19, 2) NULL,
    [CPTS]              VARCHAR (6)     NULL,
    [CPT_AMTS]          NUMERIC (19, 2) NULL,
    [CPT_DISP]          VARCHAR (4)     NULL,
    [CPT_INTERESTS]     NUMERIC (19, 8) NULL,
    [time_stamp]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([OWNER_SALE_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OWNER_SALE_CPT_u2_id_in]
    ON [dbo].[OWNER_SALE_CPT]([u2_id] ASC);

