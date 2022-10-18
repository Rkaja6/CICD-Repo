CREATE TABLE [dbo].[OG_RESERVE] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [COMPANY]         VARCHAR (4)   NULL,
    [COST_CENTER]     VARCHAR (6)   NULL,
    [FISCAL_YEAR_END] DATETIME      NULL,
    [FYE]             DATETIME      NULL,
    [PERIOD_DATE]     DATETIME      NULL,
    [PERSPECTIVE]     VARCHAR (5)   NULL,
    [YEAR_END_DATE]   DATETIME      NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

