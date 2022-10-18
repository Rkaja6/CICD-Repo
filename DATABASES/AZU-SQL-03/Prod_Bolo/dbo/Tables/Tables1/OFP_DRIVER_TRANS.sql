CREATE TABLE [dbo].[OFP_DRIVER_TRANS] (
    [u2_id]           VARCHAR (255)   NOT NULL,
    [ACTIVITY_CODE]   VARCHAR (6)     NULL,
    [ACTIVITY_DATE]   DATETIME        NULL,
    [AMT_PD]          NUMERIC (19, 2) NULL,
    [COMPANY]         VARCHAR (8)     NULL,
    [DRIVER]          VARCHAR (6)     NULL,
    [END_SALE_DATE]   DATETIME        NULL,
    [FINAL_PROC_DATE] DATETIME        NULL,
    [NO_HOURS]        NUMERIC (19, 2) NULL,
    [RATE]            NUMERIC (19, 2) NULL,
    [RATE_TYPE]       VARCHAR (4)     NULL,
    [RUN_TICKET_ID]   VARCHAR (6)     NULL,
    [time_stamp]      DATETIME        NULL,
    [u2_checksum]     VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

