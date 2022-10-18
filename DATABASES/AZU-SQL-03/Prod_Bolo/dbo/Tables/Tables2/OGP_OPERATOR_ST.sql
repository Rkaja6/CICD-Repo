﻿CREATE TABLE [dbo].[OGP_OPERATOR_ST] (
    [OGP_OPERATOR_ST_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [STATES]             VARCHAR (2)   NULL,
    [ST_CODES]           VARCHAR (8)   NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OGP_OPERATOR_ST_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OGP_OPERATOR_ST_u2_id_in]
    ON [dbo].[OGP_OPERATOR_ST]([u2_id] ASC);

