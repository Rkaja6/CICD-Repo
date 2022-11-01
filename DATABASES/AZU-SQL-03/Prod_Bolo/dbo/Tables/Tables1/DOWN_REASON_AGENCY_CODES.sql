﻿CREATE TABLE [dbo].[DOWN_REASON_AGENCY_CODES] (
    [DOWN_REASON_AGENCY_CODES_ID] VARCHAR (255) NOT NULL,
    [u2_id]                       VARCHAR (255) NULL,
    [AGENCIES]                    VARCHAR (6)   NULL,
    [AGENCY_CODES]                VARCHAR (6)   NULL,
    [time_stamp]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([DOWN_REASON_AGENCY_CODES_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DOWN_REAS_u2_id_20342]
    ON [dbo].[DOWN_REASON_AGENCY_CODES]([u2_id] ASC);
