CREATE TABLE [dbo].[MMS_PRODUCT] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [DESCRIPTION]    VARCHAR (51)  NULL,
    [DFLT_CALC_METH] VARCHAR (4)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

