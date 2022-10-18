CREATE TABLE [dbo].[CDX_PRD] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [DESCRIPTION] VARCHAR (32)  NULL,
    [NO_QTY_FLAG] VARCHAR (3)   NULL,
    [PRD]         VARCHAR (4)   NULL,
    [RPT_UNIT]    VARCHAR (5)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

