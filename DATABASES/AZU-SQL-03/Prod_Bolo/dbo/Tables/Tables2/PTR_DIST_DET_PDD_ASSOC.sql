﻿CREATE TABLE [dbo].[PTR_DIST_DET_PDD_ASSOC] (
    [PTR_DIST_DET_PDD_ASSOC_ID] VARCHAR (255) NOT NULL,
    [u2_id]                     VARCHAR (255) NULL,
    [CHANGE_PDD_INDEX]          VARCHAR (8)   NULL,
    [time_stamp]                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PTR_DIST_DET_PDD_ASSOC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTR_DIST__u2_id_87249]
    ON [dbo].[PTR_DIST_DET_PDD_ASSOC]([u2_id] ASC);

