CREATE TABLE [dbo].[CDX_DETAIL] (
    [u2_id]           VARCHAR (255)   NOT NULL,
    [BTU_FACTOR]      NUMERIC (19, 3) NULL,
    [CHECK_NO]        VARCHAR (12)    NULL,
    [COMPANY]         VARCHAR (3)     NULL,
    [FROM_PROD_DATE]  VARCHAR (5)     NULL,
    [GROSS_NET]       NUMERIC (19, 2) NULL,
    [GROSS_SEV]       NUMERIC (19, 2) NULL,
    [GROSS_VALUE]     NUMERIC (19, 2) NULL,
    [GROSS_VOLUME]    NUMERIC (19, 2) NULL,
    [OG_SALE_ID]      VARCHAR (10)    NULL,
    [OWNER_GROSS_NET] NUMERIC (19, 2) NULL,
    [PRI_TRANS_CODE]  VARCHAR (5)     NULL,
    [PROCESS_DATE]    DATETIME        NULL,
    [PRODUCT]         VARCHAR (3)     NULL,
    [PROPERTY]        VARCHAR (14)    NULL,
    [SALE_DATE]       VARCHAR (5)     NULL,
    [UPLOAD_DATE]     DATETIME        NULL,
    [VOUCHER]         VARCHAR (15)    NULL,
    [time_stamp]      DATETIME        NULL,
    [u2_checksum]     VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

