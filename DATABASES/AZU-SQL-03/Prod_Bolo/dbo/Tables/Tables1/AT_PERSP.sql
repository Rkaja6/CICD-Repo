CREATE TABLE [dbo].[AT_PERSP] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [DESCRIPTION]      VARCHAR (30)  NULL,
    [PRE_FYB_ACQ_FLAG] VARCHAR (4)   NULL,
    [TAX_FLAG]         VARCHAR (4)   NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

