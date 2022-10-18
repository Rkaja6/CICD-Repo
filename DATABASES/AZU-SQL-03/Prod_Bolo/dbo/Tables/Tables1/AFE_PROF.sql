CREATE TABLE [dbo].[AFE_PROF] (
    [u2_id]              VARCHAR (255) NOT NULL,
    [BUDGETED_ACCTS_REQ] VARCHAR (4)   NULL,
    [COMPANY]            VARCHAR (3)   NULL,
    [DFLT_RECLASS_CODE]  VARCHAR (7)   NULL,
    [time_stamp]         DATETIME      NULL,
    [u2_checksum]        VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

