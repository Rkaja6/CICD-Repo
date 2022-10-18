CREATE TABLE [dbo].[WELL_DAYS_ON] (
    [u2_id]             VARCHAR (255) NOT NULL,
    [CC_NO]             VARCHAR (11)  NULL,
    [COST_CENTER]       VARCHAR (11)  NULL,
    [GAS_DAYS_PRODUCED] NUMERIC (9)   NULL,
    [OIL_DAYS_ON]       NUMERIC (9)   NULL,
    [PROD_MONTH]        NUMERIC (9)   NULL,
    [PROD_YEAR]         NUMERIC (9)   NULL,
    [time_stamp]        DATETIME      NULL,
    [u2_checksum]       VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

