﻿CREATE TABLE [dbo].[TRACT_PROP_IDX] (
    [TRACT_PROP_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [PROPERTY_INDEX]    VARCHAR (10)  NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([TRACT_PROP_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRACT_PROP_IDX_u2_id_in]
    ON [dbo].[TRACT_PROP_IDX]([u2_id] ASC);
