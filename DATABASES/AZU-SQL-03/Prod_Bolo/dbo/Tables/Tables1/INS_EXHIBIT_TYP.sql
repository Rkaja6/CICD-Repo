﻿CREATE TABLE [dbo].[INS_EXHIBIT_TYP] (
    [INS_EXHIBIT_TYP_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [INS_TYPES]          VARCHAR (54)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([INS_EXHIBIT_TYP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [INS_EXHIBIT_TYP_u2_id_in]
    ON [dbo].[INS_EXHIBIT_TYP]([u2_id] ASC);

