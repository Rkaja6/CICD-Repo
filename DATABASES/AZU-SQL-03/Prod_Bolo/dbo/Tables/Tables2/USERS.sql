﻿CREATE TABLE [dbo].[USERS] (
    [u2_id]             VARCHAR (255) NOT NULL,
    [BEG_ACCESS]        VARCHAR (12)  NULL,
    [DFLT_BANNER_PRINT] VARCHAR (7)   NULL,
    [DFLT_CO]           VARCHAR (4)   NULL,
    [DFLT_LOGIN_PGM]    VARCHAR (9)   NULL,
    [DFLT_PED]          DATETIME      NULL,
    [DFLT_QUEUE]        VARCHAR (5)   NULL,
    [DFLT_UPLOAD_PATH]  VARCHAR (31)  NULL,
    [EMAIL]             VARCHAR (32)  NULL,
    [END_ACCESS]        VARCHAR (12)  NULL,
    [EXTENSION]         VARCHAR (5)   NULL,
    [INITIALS]          VARCHAR (3)   NULL,
    [LANG]              VARCHAR (8)   NULL,
    [MODEL_USER]        VARCHAR (5)   NULL,
    [NAME]              VARCHAR (37)  NULL,
    [PASSWORD]          VARCHAR (6)   NULL,
    [PROMPT_MODE]       VARCHAR (1)   NULL,
    [PR_COLUMNS]        VARCHAR (7)   NULL,
    [PR_DUPLEX]         VARCHAR (10)  NULL,
    [PR_MEDIA]          VARCHAR (5)   NULL,
    [PR_MODE]           VARCHAR (4)   NULL,
    [PR_ORIENTATION]    VARCHAR (11)  NULL,
    [PR_PRQREF]         VARCHAR (15)  NULL,
    [PR_PR_FLAG]        VARCHAR (4)   NULL,
    [PR_ROWS]           VARCHAR (7)   NULL,
    [QUERY_ACCESS_FLAG] VARCHAR (1)   NULL,
    [REMARKS]           VARCHAR (538) NULL,
    [SUPERIOR]          VARCHAR (15)  NULL,
    [TAX_ID_ACCESS]     VARCHAR (6)   NULL,
    [TELEPHONE]         VARCHAR (61)  NULL,
    [TERMINATION_DATE]  DATETIME      NULL,
    [USER_ID]           VARCHAR (126) NULL,
    [time_stamp]        DATETIME      NULL,
    [u2_checksum]       VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);
