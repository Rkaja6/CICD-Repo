CREATE TABLE [dbo].[AV_INV_CPT] (
    [subValueId]     VARCHAR (255)   NOT NULL,
    [AV_INV_CTRC_ID] VARCHAR (255)   NULL,
    [CPTS]           VARCHAR (6)     NULL,
    [CPT_AMTS]       NUMERIC (19, 2) NULL,
    [CPT_BASIS]      VARCHAR (10)    NULL,
    [time_stamp]     DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AV_INV_CPT_AV_INV_CTRC_ID_in]
    ON [dbo].[AV_INV_CPT]([AV_INV_CTRC_ID] ASC);

