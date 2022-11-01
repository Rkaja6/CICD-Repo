﻿CREATE TABLE [dbo].[BUS_RELATION_CTL_ID] (
    [BUS_RELATION_CTL_ID_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [BUS_RELATION_CTL]       VARCHAR (8)   NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([BUS_RELATION_CTL_ID_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [BUS_RELATION_CTL_ID_u2_id_in]
    ON [dbo].[BUS_RELATION_CTL_ID]([u2_id] ASC);
