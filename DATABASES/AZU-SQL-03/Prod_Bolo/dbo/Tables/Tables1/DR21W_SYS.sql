CREATE TABLE [dbo].[DR21W_SYS] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [MAINT_TAX_YEAR] VARCHAR (5)   NULL,
    [TAX_YEAR]       VARCHAR (4)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

