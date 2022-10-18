CREATE TABLE [dbo].[AT_DEPR_METHOD] (
    [u2_id]                   VARCHAR (255)   NOT NULL,
    [AT_PCT_DEPR_ID]          VARCHAR (5)     NULL,
    [BONUS_AT_DEPR_METHOD_ID] VARCHAR (6)     NULL,
    [CALC_CONVENTION]         VARCHAR (4)     NULL,
    [DECLINING_BAL_PCT]       NUMERIC (19, 2) NULL,
    [DESCRIPTION]             VARCHAR (41)    NULL,
    [LIFE]                    NUMERIC (19, 2) NULL,
    [SALVAGE_VALUE_ENABLED]   VARCHAR (7)     NULL,
    [TYPE]                    VARCHAR (6)     NULL,
    [time_stamp]              DATETIME        NULL,
    [u2_checksum]             VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

