CREATE TABLE [dbo].[DIV_CPT] (
    [DIV_CPT_ID]         VARCHAR (255)   NOT NULL,
    [u2_id]              VARCHAR (255)   NULL,
    [COMPONENTS]         VARCHAR (6)     NULL,
    [CPT_88S_SUPP]       VARCHAR (7)     NULL,
    [CPT_ALLOC_INT_CATS] VARCHAR (10)    NULL,
    [CPT_ALLOC_TYPES]    VARCHAR (4)     NULL,
    [TOTAL_CPT_ENTERED]  NUMERIC (19, 8) NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([DIV_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DIV_CPT_u2_id_in]
    ON [dbo].[DIV_CPT]([u2_id] ASC);

