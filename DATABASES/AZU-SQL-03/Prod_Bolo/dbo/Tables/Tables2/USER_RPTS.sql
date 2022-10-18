CREATE TABLE [dbo].[USER_RPTS] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [BP_TABLE]         VARCHAR (8)   NULL,
    [CTL_TABLE]        VARCHAR (10)  NULL,
    [DASHBOARD_FLAG]   VARCHAR (3)   NULL,
    [DESCRIPTION]      VARCHAR (25)  NULL,
    [ENH_RPTG_FLAG]    VARCHAR (3)   NULL,
    [EXPORT_TYPE]      VARCHAR (6)   NULL,
    [LIST_NAME]        VARCHAR (10)  NULL,
    [LIST_REQ]         VARCHAR (4)   NULL,
    [LIST_TYPE]        VARCHAR (4)   NULL,
    [MAPPED_BASIC]     VARCHAR (2)   NULL,
    [OLD_VERSION_FLAG] VARCHAR (7)   NULL,
    [PARAMS_TABLE]     VARCHAR (15)  NULL,
    [SEC_TABLE]        VARCHAR (10)  NULL,
    [TERT_TABLE]       VARCHAR (10)  NULL,
    [TYPE]             VARCHAR (4)   NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

