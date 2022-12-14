CREATE TABLE [dbo].[DIV] (
    [u2_id]                      VARCHAR (255)   NOT NULL,
    [APPROVED_FLAG]              VARCHAR (4)     NULL,
    [BEGIN_SALE_DATE]            DATETIME        NULL,
    [BUR_COMPLETE_FLAG]          VARCHAR (4)     NULL,
    [CNV_ID]                     VARCHAR (191)   NULL,
    [CNV_NAME]                   VARCHAR (10)    NULL,
    [COMPANY]                    VARCHAR (4)     NULL,
    [COST_CENTER]                VARCHAR (8)     NULL,
    [CPT_COMPLETE_FLAG]          VARCHAR (4)     NULL,
    [DESCRIPTION]                VARCHAR (240)   NULL,
    [EIGHT8S_SUPP]               VARCHAR (4)     NULL,
    [END_SALE_DATE]              DATETIME        NULL,
    [INACTIVE_DATE]              DATETIME        NULL,
    [INACTIVE_REASON]            VARCHAR (50)    NULL,
    [INFLATION_FACTOR]           NUMERIC (19, 8) NULL,
    [NRI_COMPLETE_FLAG]          VARCHAR (4)     NULL,
    [NRI_RPTG_DOI]               VARCHAR (4)     NULL,
    [PARENT_DOI]                 VARCHAR (6)     NULL,
    [PRODUCT]                    VARCHAR (3)     NULL,
    [PROPERTY]                   VARCHAR (16)    NULL,
    [PROP_CHANGE_ID]             VARCHAR (10)    NULL,
    [RI_COMPLETE_FLAG]           VARCHAR (4)     NULL,
    [TOTAL_NRI_ENTERED]          NUMERIC (19, 8) NULL,
    [TOTAL_ROYALTIES_ENTERED]    NUMERIC (19, 8) NULL,
    [TOTAL_ROYALTY]              NUMERIC (19, 8) NULL,
    [TOTAL_WI_ENTERED]           NUMERIC (19, 8) NULL,
    [TYPE]                       VARCHAR (4)     NULL,
    [WELL_INFO_TERMINATION_DATE] DATETIME        NULL,
    [WI_COMPLETE_FLAG]           VARCHAR (4)     NULL,
    [time_stamp]                 DATETIME        NULL,
    [u2_checksum]                VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

