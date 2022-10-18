CREATE TABLE [dbo].[LSE_CTRC] (
    [u2_id]               VARCHAR (255)  NOT NULL,
    [COMPANY]             VARCHAR (10)   NULL,
    [CONTRACT_DATE]       DATETIME       NULL,
    [CONTRACT_DESC]       VARCHAR (3105) NULL,
    [CONTRACT_ID]         VARCHAR (16)   NULL,
    [CONTRACT_NAME]       VARCHAR (242)  NULL,
    [CONTRACT_STATUS]     VARCHAR (6)    NULL,
    [CONTRACT_TYPE]       VARCHAR (11)   NULL,
    [EFF_DATE]            DATETIME       NULL,
    [EXP_DATE]            DATETIME       NULL,
    [OFFICE]              VARCHAR (6)    NULL,
    [OPERATOR]            VARCHAR (30)   NULL,
    [TERMINATION_DATE]    DATETIME       NULL,
    [TERMINATION_REMARKS] VARCHAR (137)  NULL,
    [TERMINATION_TYPE]    VARCHAR (4)    NULL,
    [TRACT_CTR]           VARCHAR (5)    NULL,
    [time_stamp]          DATETIME       NULL,
    [u2_checksum]         VARCHAR (25)   NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

