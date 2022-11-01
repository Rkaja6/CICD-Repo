﻿CREATE TABLE [dbo].[CDX_CHECK_VOU] (
    [CDX_CHECK_VOU_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [VOUCHERS]         VARCHAR (15)  NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CDX_CHECK_VOU_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CDX_CHECK_VOU_u2_id_in]
    ON [dbo].[CDX_CHECK_VOU]([u2_id] ASC);
