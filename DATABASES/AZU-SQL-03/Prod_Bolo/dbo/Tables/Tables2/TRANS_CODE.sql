CREATE TABLE [dbo].[TRANS_CODE] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [COMPANY]       VARCHAR (3)   NULL,
    [COST_CENTER]   VARCHAR (6)   NULL,
    [DESCRIPTION]   VARCHAR (43)  NULL,
    [INACTIVE_DATE] DATETIME      NULL,
    [TRANS_CAT]     VARCHAR (19)  NULL,
    [TRANS_CODE]    VARCHAR (30)  NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

