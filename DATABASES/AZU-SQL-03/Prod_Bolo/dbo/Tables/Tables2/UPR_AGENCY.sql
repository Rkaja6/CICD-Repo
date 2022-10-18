CREATE TABLE [dbo].[UPR_AGENCY] (
    [u2_id]               VARCHAR (255)   NOT NULL,
    [ABANDONMENT_PERIOD]  VARCHAR (8)     NULL,
    [AGENCY_VENDOR]       VARCHAR (9)     NULL,
    [CUTOFF_MONTH]        VARCHAR (6)     NULL,
    [DUE_DATE]            DATETIME        NULL,
    [DUE_DILIGENCE_AMT]   NUMERIC (19, 2) NULL,
    [DUE_DILIGENCE_REQ]   VARCHAR (3)     NULL,
    [ID]                  VARCHAR (126)   NULL,
    [MIN_RPT_CO_TOTAL]    NUMERIC (19, 2) NULL,
    [MIN_RPT_OWNER_TOTAL] NUMERIC (19, 2) NULL,
    [NEGATIVE_REPORTS]    VARCHAR (3)     NULL,
    [PAY_TO_CURRENT]      VARCHAR (4)     NULL,
    [WIRE_TRANSFER]       VARCHAR (5)     NULL,
    [time_stamp]          DATETIME        NULL,
    [u2_checksum]         VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

