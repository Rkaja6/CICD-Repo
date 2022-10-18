CREATE TABLE [dbo].[OBD_COA] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [EXISTS_]     VARCHAR (6)   NULL,
    [JIB_REQ]     VARCHAR (5)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

