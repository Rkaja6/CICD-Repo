CREATE TABLE [dbo].[OFP_COMP_CODE] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CATEGORY]    VARCHAR (8)   NULL,
    [DESCRIPTION] VARCHAR (40)  NULL,
    [SUM_RPT_CAT] VARCHAR (8)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

