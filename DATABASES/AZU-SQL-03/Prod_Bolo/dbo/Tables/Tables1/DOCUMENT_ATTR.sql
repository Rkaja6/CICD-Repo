﻿CREATE TABLE [dbo].[DOCUMENT_ATTR] (
    [DOCUMENT_ATTR_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [ATTRIBUTES]       VARCHAR (16)  NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([DOCUMENT_ATTR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DOCUMENT_ATTR_u2_id_in]
    ON [dbo].[DOCUMENT_ATTR]([u2_id] ASC);

