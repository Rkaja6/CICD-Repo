﻿CREATE TABLE [dbo].[DM_DICT_EDIT_CDS] (
    [DM_DICT_EDIT_CDS_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [EDIT_CODES]          VARCHAR (6)   NULL,
    [EDIT_VALUES]         VARCHAR (15)  NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([DM_DICT_EDIT_CDS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DM_DICT_EDIT_CDS_u2_id_in]
    ON [dbo].[DM_DICT_EDIT_CDS]([u2_id] ASC);

