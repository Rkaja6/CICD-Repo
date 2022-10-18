CREATE TABLE [dbo].[PRICE_TIER] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [DESCRIPTION]      VARCHAR (30)  NULL,
    [PRD_CAT]          VARCHAR (7)   NULL,
    [SINGLE_LEVEL_ADJ] VARCHAR (6)   NULL,
    [UOM]              VARCHAR (7)   NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

