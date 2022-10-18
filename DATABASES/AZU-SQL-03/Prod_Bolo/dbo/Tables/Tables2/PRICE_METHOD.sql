CREATE TABLE [dbo].[PRICE_METHOD] (
    [u2_id]                    VARCHAR (255) NOT NULL,
    [AGGREGATE_CONTRACTS_FLAG] VARCHAR (9)   NULL,
    [DESCRIPTION]              VARCHAR (30)  NULL,
    [EQUAL_DAILY]              VARCHAR (5)   NULL,
    [EXPORT_CODE]              VARCHAR (10)  NULL,
    [METHOD_DISP]              VARCHAR (4)   NULL,
    [PRD_CAT]                  VARCHAR (3)   NULL,
    [PRICE_FORMULA]            VARCHAR (30)  NULL,
    [PRICE_FORMULA_RULE]       VARCHAR (7)   NULL,
    [PRICE_FORM_ID]            VARCHAR (7)   NULL,
    [SUMMARY_CONTRACT_REQ]     VARCHAR (8)   NULL,
    [TEST_CONTRACT]            VARCHAR (8)   NULL,
    [TEST_MEAS_PT]             VARCHAR (7)   NULL,
    [TEST_SALE_DATE]           DATETIME      NULL,
    [UOM]                      VARCHAR (5)   NULL,
    [time_stamp]               DATETIME      NULL,
    [u2_checksum]              VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

