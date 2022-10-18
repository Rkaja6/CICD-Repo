CREATE TABLE [dbo].[RR_LA] (
    [u2_id]             VARCHAR (255)   NOT NULL,
    [CONS_WELL_NUMBER]  VARCHAR (6)     NULL,
    [DFLT_CPTS_FLAG]    VARCHAR (4)     NULL,
    [EXCLUSION_CODE]    VARCHAR (4)     NULL,
    [OGP_PROP_NO]       VARCHAR (12)    NULL,
    [PAYOUT_ACTUAL_AMT] NUMERIC (19, 2) NULL,
    [PAYOUT_TERM]       VARCHAR (6)     NULL,
    [PAYOUT_TOTAL_AMT]  NUMERIC (19, 2) NULL,
    [PLANT_CODE]        VARCHAR (5)     NULL,
    [SERIAL_NUMBER]     VARCHAR (6)     NULL,
    [TAX_LIABLE]        VARCHAR (3)     NULL,
    [time_stamp]        DATETIME        NULL,
    [u2_checksum]       VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

