CREATE TABLE [dbo].[GL_POCCUR_PROJ_CONS] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [PROJECT]     VARCHAR (28)  NULL,
    [UNUSED]      VARCHAR (5)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

