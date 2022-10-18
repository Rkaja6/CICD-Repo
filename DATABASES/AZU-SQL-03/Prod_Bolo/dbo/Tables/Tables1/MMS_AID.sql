CREATE TABLE [dbo].[MMS_AID] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CALC_METH]   VARCHAR (4)   NULL,
    [CONTRACT]    VARCHAR (10)  NULL,
    [PRODUCT]     VARCHAR (3)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

