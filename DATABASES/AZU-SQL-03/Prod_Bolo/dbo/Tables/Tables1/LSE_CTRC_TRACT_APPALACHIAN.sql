﻿CREATE TABLE [dbo].[LSE_CTRC_TRACT_APPALACHIAN] (
    [LSE_CTRC_TRACT_APPALACHIAN_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                         VARCHAR (255)   NULL,
    [AP_TOWNSHIP]                   VARCHAR (20)    NULL,
    [AP_TOWNSHIP_DESCS]             VARCHAR (30)    NULL,
    [AP_TOWNSHIP_GROSS_ACRES]       NUMERIC (19, 4) NULL,
    [AP_TOWNSHIP_TAX_MAP]           VARCHAR (10)    NULL,
    [time_stamp]                    DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([LSE_CTRC_TRACT_APPALACHIAN_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LSE_CTRC__u2_id_84915]
    ON [dbo].[LSE_CTRC_TRACT_APPALACHIAN]([u2_id] ASC);

