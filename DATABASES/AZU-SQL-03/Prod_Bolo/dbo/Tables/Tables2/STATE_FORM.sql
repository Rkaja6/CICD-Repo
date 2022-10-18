CREATE TABLE [dbo].[STATE_FORM] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [ADJ_FORM]        VARCHAR (15)  NULL,
    [DESCRIPTION]     VARCHAR (42)  NULL,
    [EDI_HDR]         VARCHAR (3)   NULL,
    [EDI_SUM]         VARCHAR (3)   NULL,
    [FORM]            VARCHAR (10)  NULL,
    [STATE]           VARCHAR (2)   NULL,
    [STATE_FORM_CODE] VARCHAR (5)   NULL,
    [SUPP_FORM]       VARCHAR (15)  NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

