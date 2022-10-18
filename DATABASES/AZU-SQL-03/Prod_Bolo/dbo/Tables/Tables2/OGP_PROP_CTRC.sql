CREATE TABLE [dbo].[OGP_PROP_CTRC] (
    [u2_id]             VARCHAR (255) NOT NULL,
    [COMPANY]           VARCHAR (3)   NULL,
    [CONTRACT]          VARCHAR (10)  NULL,
    [CO_CONFLICT]       VARCHAR (8)   NULL,
    [FORMATION]         VARCHAR (30)  NULL,
    [PROPERTY]          VARCHAR (13)  NULL,
    [SEN168_FLAG]       VARCHAR (3)   NULL,
    [STATE_GAS_PRODUCT] VARCHAR (5)   NULL,
    [STATE_NGL_PRODUCT] VARCHAR (5)   NULL,
    [STATE_OIL_PRODUCT] VARCHAR (5)   NULL,
    [TAX_ANALYST]       VARCHAR (9)   NULL,
    [time_stamp]        DATETIME      NULL,
    [u2_checksum]       VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

