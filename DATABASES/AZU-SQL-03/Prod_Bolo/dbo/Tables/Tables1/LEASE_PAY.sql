CREATE TABLE [dbo].[LEASE_PAY] (
    [u2_id]              VARCHAR (255)   NOT NULL,
    [CALENDAR_REMARKS]   VARCHAR (760)   NULL,
    [COMPLETE_FLAG]      VARCHAR (8)     NULL,
    [CPI_FLAG]           VARCHAR (4)     NULL,
    [FIRST_DATE]         DATETIME        NULL,
    [LAST_DATE]          DATETIME        NULL,
    [LEASE_ID]           VARCHAR (12)    NULL,
    [NEXT_DUE_DATE]      DATETIME        NULL,
    [PERIOD]             VARCHAR (6)     NULL,
    [PMT_AMT_RECEIVABLE] NUMERIC (19, 2) NULL,
    [PMT_REMARKS]        VARCHAR (274)   NULL,
    [PMT_TYPE]           VARCHAR (8)     NULL,
    [TOTAL_LESSOR_AMT]   NUMERIC (19, 2) NULL,
    [time_stamp]         DATETIME        NULL,
    [u2_checksum]        VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

