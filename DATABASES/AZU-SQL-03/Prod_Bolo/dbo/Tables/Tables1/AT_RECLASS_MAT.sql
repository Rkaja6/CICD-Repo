CREATE TABLE [dbo].[AT_RECLASS_MAT] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [ALLOC_QTY_FLAG]  VARCHAR (7)   NULL,
    [AT_RECLASS_TYPE] VARCHAR (7)   NULL,
    [COMPANY]         VARCHAR (4)   NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

