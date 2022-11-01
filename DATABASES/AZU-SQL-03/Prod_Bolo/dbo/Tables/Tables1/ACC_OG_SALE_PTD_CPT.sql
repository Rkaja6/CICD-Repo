﻿CREATE TABLE [dbo].[ACC_OG_SALE_PTD_CPT] (
    [subValueId]         VARCHAR (255)   NOT NULL,
    [ACC_OG_SALE_CPT_ID] VARCHAR (255)   NULL,
    [PTD_CPTS]           VARCHAR (10)    NULL,
    [PTD_CPT_AMTS]       NUMERIC (19, 2) NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ACC_OG_SA_ACC_OG_SA_52169]
    ON [dbo].[ACC_OG_SALE_PTD_CPT]([ACC_OG_SALE_CPT_ID] ASC);
