CREATE TABLE [dbo].[ROY_NM_MAP] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [CONTRACT]    VARCHAR (13)  NULL,
    [OGP_PROP_ID] VARCHAR (12)  NULL,
    [OGP_PROP_NO] VARCHAR (12)  NULL,
    [PROD_CAT]    VARCHAR (5)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

