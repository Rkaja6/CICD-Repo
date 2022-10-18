CREATE TABLE [dbo].[CDX_CHECK] (
    [u2_id]             VARCHAR (255)   NOT NULL,
    [CHECK_AMT]         NUMERIC (19, 2) NULL,
    [CHECK_NO]          VARCHAR (12)    NULL,
    [COMPANY]           VARCHAR (3)     NULL,
    [EFF_DATE]          VARCHAR (4)     NULL,
    [NET_OUT_FLAG]      VARCHAR (3)     NULL,
    [OWNER_NO]          VARCHAR (12)    NULL,
    [PMT_FLAG]          VARCHAR (4)     NULL,
    [PROCESS_COMPLETE]  DATETIME        NULL,
    [RECORD_COUNT]      NUMERIC (9)     NULL,
    [TOT_GROSS_CPT_AMT] NUMERIC (19, 2) NULL,
    [TOT_GROSS_SEV]     NUMERIC (19, 2) NULL,
    [TOT_GROSS_VOL]     NUMERIC (19, 2) NULL,
    [TOT_LEASE_NET]     NUMERIC (19, 2) NULL,
    [TOT_NET]           NUMERIC (19, 2) NULL,
    [TOT_NET_CPT_AMT]   NUMERIC (19, 2) NULL,
    [TRANSMIT_DATE]     VARCHAR (5)     NULL,
    [UPLOAD_DATE]       DATETIME        NULL,
    [time_stamp]        DATETIME        NULL,
    [u2_checksum]       VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

