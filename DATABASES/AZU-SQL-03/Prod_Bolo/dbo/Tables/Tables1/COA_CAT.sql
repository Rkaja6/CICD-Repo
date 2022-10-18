CREATE TABLE [dbo].[COA_CAT] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [DESCRIPTION]     VARCHAR (34)  NULL,
    [PL_CLOSING_FLAG] VARCHAR (15)  NULL,
    [REVALUE_FLAG]    VARCHAR (5)   NULL,
    [TYPE]            VARCHAR (4)   NULL,
    [WIP_FLAG]        VARCHAR (4)   NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

