CREATE TABLE [dbo].[STATE_WTYPE] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [DESCRIPTION]    VARCHAR (44)  NULL,
    [RPT_CD]         VARCHAR (3)   NULL,
    [RPT_CD1]        VARCHAR (3)   NULL,
    [STATE]          VARCHAR (3)   NULL,
    [STATE_FORM_REF] VARCHAR (5)   NULL,
    [WELL_CLASS]     VARCHAR (3)   NULL,
    [WELL_TAX_TYPE]  VARCHAR (5)   NULL,
    [WELL_TYPE]      VARCHAR (3)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

