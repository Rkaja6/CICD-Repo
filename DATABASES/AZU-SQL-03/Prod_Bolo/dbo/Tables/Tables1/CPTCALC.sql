CREATE TABLE [dbo].[CPTCALC] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CLASS]       VARCHAR (8)   NULL,
    [DISTRICT]    VARCHAR (8)   NULL,
    [PRODUCT]     VARCHAR (3)   NULL,
    [STATE]       VARCHAR (2)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

