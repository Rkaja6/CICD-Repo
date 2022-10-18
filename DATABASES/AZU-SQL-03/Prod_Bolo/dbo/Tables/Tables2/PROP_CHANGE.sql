CREATE TABLE [dbo].[PROP_CHANGE] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [APPR]            VARCHAR (10)  NULL,
    [APPR_DATE]       DATETIME      NULL,
    [BUYER]           VARCHAR (10)  NULL,
    [CLOSE_DATE]      DATETIME      NULL,
    [COMPANY]         VARCHAR (3)   NULL,
    [EFF_DATE]        DATETIME      NULL,
    [FINAL_STTL_DATE] DATETIME      NULL,
    [PAY_CODE]        VARCHAR (6)   NULL,
    [PAY_REMIT_FLAG]  VARCHAR (3)   NULL,
    [REASON]          VARCHAR (30)  NULL,
    [RV_PAYEE]        VARCHAR (10)  NULL,
    [SALE_TYPE]       VARCHAR (8)   NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

