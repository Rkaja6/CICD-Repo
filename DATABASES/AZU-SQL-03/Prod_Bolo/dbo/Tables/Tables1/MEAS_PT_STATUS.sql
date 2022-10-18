CREATE TABLE [dbo].[MEAS_PT_STATUS] (
    [u2_id]             VARCHAR (255)   NOT NULL,
    [ALLOC_DATE]        DATETIME        NULL,
    [MEAS_PT]           VARCHAR (8)     NULL,
    [POSTED_DATE]       DATETIME        NULL,
    [SALE_DATE]         DATETIME        NULL,
    [STATUS]            VARCHAR (6)     NULL,
    [TOTAL_GROSS_VALUE] NUMERIC (19, 2) NULL,
    [VALUE_DATE]        DATETIME        NULL,
    [time_stamp]        DATETIME        NULL,
    [u2_checksum]       VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

