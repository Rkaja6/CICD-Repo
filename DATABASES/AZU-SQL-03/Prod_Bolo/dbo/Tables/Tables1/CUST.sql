CREATE TABLE [dbo].[CUST] (
    [u2_id]                     VARCHAR (255)   NOT NULL,
    [AR_ACCT]                   VARCHAR (9)     NULL,
    [BILL_ADDRESS]              VARCHAR (7)     NULL,
    [CONTACT_COMMENTS_DSPLY]    VARCHAR (72)    NULL,
    [DFLT_BILL_DISP_FLAG]       VARCHAR (7)     NULL,
    [DFLT_NET_AFE_FLAG]         VARCHAR (4)     NULL,
    [DFLT_NET_AR_FLAG]          VARCHAR (4)     NULL,
    [DFLT_NET_COST_CENTER_FLAG] VARCHAR (6)     NULL,
    [DFLT_NET_FLAG]             VARCHAR (7)     NULL,
    [ELECTRONIC_JIB_FLAG]       VARCHAR (4)     NULL,
    [INSIDE_COMPANY]            VARCHAR (8)     NULL,
    [INS_SURCHARGE]             NUMERIC (19, 4) NULL,
    [JIB_PRINT_FLAG]            VARCHAR (5)     NULL,
    [JIB_SUMM_EXCL]             VARCHAR (4)     NULL,
    [LAST_ACTIVITY_DATE]        DATETIME        NULL,
    [NET_RV_OWNER]              VARCHAR (8)     NULL,
    [REMARKS_DSPLY]             VARCHAR (154)   NULL,
    [REMIT_TO]                  VARCHAR (7)     NULL,
    [time_stamp]                DATETIME        NULL,
    [u2_checksum]               VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

