CREATE TABLE [dbo].[MMS_TRANS_INDEX] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [CPT_CODE]     VARCHAR (3)   NULL,
    [MMS_ADJ_CD]   VARCHAR (6)   NULL,
    [MMS_PMT_CD]   VARCHAR (6)   NULL,
    [MMS_TRANS_CD] VARCHAR (8)   NULL,
    [PAY_CODE]     VARCHAR (3)   NULL,
    [SALE_TYPE]    VARCHAR (4)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

