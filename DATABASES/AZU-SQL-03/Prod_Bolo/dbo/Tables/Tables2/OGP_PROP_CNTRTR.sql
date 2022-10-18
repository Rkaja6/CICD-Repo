﻿CREATE TABLE [dbo].[OGP_PROP_CNTRTR] (
    [OGP_PROP_CNTRTR_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [CONTRACTORS]        VARCHAR (8)   NULL,
    [CONTRACT_EFF_DATES] DATETIME      NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OGP_PROP_CNTRTR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_PROP_CNTRTR_u2_id_in]
    ON [dbo].[OGP_PROP_CNTRTR]([u2_id] ASC);

