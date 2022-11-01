﻿CREATE TABLE [dbo].[LSE_CTRC_PARTCPNTS] (
    [LSE_CTRC_PARTCPNTS_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                 VARCHAR (255)   NULL,
    [PARTICIPANTS]          VARCHAR (10)    NULL,
    [PARTICIPANT_GROUPS]    VARCHAR (10)    NULL,
    [PARTICIPANT_INTERESTS] NUMERIC (19, 8) NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([LSE_CTRC_PARTCPNTS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LSE_CTRC_PARTCPNTS_u2_id_in]
    ON [dbo].[LSE_CTRC_PARTCPNTS]([u2_id] ASC);
