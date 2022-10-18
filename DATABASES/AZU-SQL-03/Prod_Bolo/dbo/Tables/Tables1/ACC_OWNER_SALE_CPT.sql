CREATE TABLE [dbo].[ACC_OWNER_SALE_CPT] (
    [ACC_OWNER_SALE_CPT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                 VARCHAR (255)   NULL,
    [CPTS]                  VARCHAR (6)     NULL,
    [CPT_AMTS]              NUMERIC (19, 2) NULL,
    [CPT_DISP]              VARCHAR (4)     NULL,
    [CPT_INTERESTS]         NUMERIC (19, 8) NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([ACC_OWNER_SALE_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ACC_OWNER_SALE_CPT_u2_id_in]
    ON [dbo].[ACC_OWNER_SALE_CPT]([u2_id] ASC);

