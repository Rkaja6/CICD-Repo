CREATE TABLE [dbo].[LSE_CTRC_TRACT] (
    [u2_id]               VARCHAR (255)  NOT NULL,
    [BASIN]               VARCHAR (5)    NULL,
    [CONTRACT]            VARCHAR (10)   NULL,
    [COUNTY]              VARCHAR (10)   NULL,
    [DISTRICT]            VARCHAR (10)   NULL,
    [FIELD_ID]            VARCHAR (10)   NULL,
    [LEGAL_DESC_ID]       VARCHAR (13)   NULL,
    [MERIDIAN]            VARCHAR (8)    NULL,
    [OTHER_LEGAL_DESC]    VARCHAR (3889) NULL,
    [PROSPECT]            VARCHAR (10)   NULL,
    [STATE]               VARCHAR (10)   NULL,
    [TERMINATION_DATE]    DATETIME       NULL,
    [TERMINATION_REMARKS] VARCHAR (25)   NULL,
    [TERMINATION_TYPE]    VARCHAR (4)    NULL,
    [TRACT_NO]            VARCHAR (9)    NULL,
    [time_stamp]          DATETIME       NULL,
    [u2_checksum]         VARCHAR (25)   NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

