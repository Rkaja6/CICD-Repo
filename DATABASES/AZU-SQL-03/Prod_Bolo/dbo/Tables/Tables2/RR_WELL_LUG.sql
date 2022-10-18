CREATE TABLE [dbo].[RR_WELL_LUG] (
    [u2_id]                     VARCHAR (255)   NOT NULL,
    [COMPANY]                   VARCHAR (10)    NULL,
    [LEASE_USE_PERCENT]         NUMERIC (19, 6) NULL,
    [LU_WELL_ID]                VARCHAR (10)    NULL,
    [ORR_DEDUCT_ID]             VARCHAR (10)    NULL,
    [ORR_DEDUCT_VALUE]          VARCHAR (12)    NULL,
    [ORR_LEASE_USE_VALUE]       NUMERIC (19, 2) NULL,
    [ORR_LSEUSE_COMPANY_VOLUME] NUMERIC (19, 2) NULL,
    [ORR_LU_ID]                 VARCHAR (10)    NULL,
    [PROD_PERIOD]               DATETIME        NULL,
    [time_stamp]                DATETIME        NULL,
    [u2_checksum]               VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

