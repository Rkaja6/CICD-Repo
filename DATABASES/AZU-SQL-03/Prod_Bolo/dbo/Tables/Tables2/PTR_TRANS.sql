CREATE TABLE [dbo].[PTR_TRANS] (
    [u2_id]                  VARCHAR (255) NOT NULL,
    [ALLOC_DATE]             VARCHAR (8)   NULL,
    [COA_GRP]                VARCHAR (8)   NULL,
    [COA_GRP_SELECT]         VARCHAR (6)   NULL,
    [PDD_CC_ID]              VARCHAR (11)  NULL,
    [PDD_COA_GRP]            VARCHAR (8)   NULL,
    [PDD_PTRSHP_NO]          VARCHAR (6)   NULL,
    [PTRSHP_DIST_CONTROL_ID] VARCHAR (10)  NULL,
    [PTRSHP_DIST_DET_ID]     VARCHAR (9)   NULL,
    [PTRSHP_NO]              VARCHAR (6)   NULL,
    [SYSTEM_DATE]            VARCHAR (8)   NULL,
    [SYSTEM_TIME]            VARCHAR (8)   NULL,
    [SYSTEM_USER_ID]         VARCHAR (6)   NULL,
    [time_stamp]             DATETIME      NULL,
    [u2_checksum]            VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

