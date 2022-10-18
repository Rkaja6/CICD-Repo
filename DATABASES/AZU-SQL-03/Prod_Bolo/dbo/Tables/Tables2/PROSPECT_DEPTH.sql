﻿CREATE TABLE [dbo].[PROSPECT_DEPTH] (
    [PROSPECT_DEPTH_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [FROM_DEPTHS]       VARCHAR (6)   NULL,
    [FROM_FORMATIONS]   VARCHAR (9)   NULL,
    [FROM_REFERENCES]   VARCHAR (6)   NULL,
    [TO_DEPTHS]         VARCHAR (6)   NULL,
    [TO_FORMATIONS]     VARCHAR (9)   NULL,
    [TO_REFERENCES]     VARCHAR (6)   NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PROSPECT_DEPTH_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROSPECT_DEPTH_u2_id_in]
    ON [dbo].[PROSPECT_DEPTH]([u2_id] ASC);

