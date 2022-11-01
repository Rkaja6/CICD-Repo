﻿CREATE TABLE [dbo].[IR_PGM_INV] (
    [IR_PGM_INV_ID] VARCHAR (255) NOT NULL,
    [u2_id]         VARCHAR (255) NULL,
    [INVESTORS]     VARCHAR (8)   NULL,
    [time_stamp]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([IR_PGM_INV_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IR_PGM_INV_u2_id_in]
    ON [dbo].[IR_PGM_INV]([u2_id] ASC);
