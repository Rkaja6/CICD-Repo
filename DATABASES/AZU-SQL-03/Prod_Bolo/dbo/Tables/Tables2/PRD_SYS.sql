CREATE TABLE [dbo].[PRD_SYS] (
    [u2_id]               VARCHAR (255)   NOT NULL,
    [GAS_PRODUCT]         VARCHAR (7)     NULL,
    [LEASE_USE_RPTG_DISP] VARCHAR (6)     NULL,
    [NGL_PRODUCT]         VARCHAR (7)     NULL,
    [OIL_PRODUCT]         VARCHAR (7)     NULL,
    [PRD_UPLOAD_SUB]      VARCHAR (15)    NULL,
    [PRESSURE_BASE]       NUMERIC (19, 3) NULL,
    [PURCHASER_REQUIRED]  VARCHAR (5)     NULL,
    [TERM_DATE_EDIT_FLAG] VARCHAR (11)    NULL,
    [WATER_PRODUCT]       VARCHAR (7)     NULL,
    [time_stamp]          DATETIME        NULL,
    [u2_checksum]         VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

