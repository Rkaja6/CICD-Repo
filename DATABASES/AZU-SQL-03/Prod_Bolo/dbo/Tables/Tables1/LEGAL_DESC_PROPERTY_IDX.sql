﻿CREATE TABLE [dbo].[LEGAL_DESC_PROPERTY_IDX] (
    [LEGAL_DESC_PROPERTY_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                      VARCHAR (255) NULL,
    [PROPERTY_INDEX]             VARCHAR (10)  NULL,
    [time_stamp]                 DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LEGAL_DESC_PROPERTY_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LEGAL_DES_u2_id_57085]
    ON [dbo].[LEGAL_DESC_PROPERTY_IDX]([u2_id] ASC);

