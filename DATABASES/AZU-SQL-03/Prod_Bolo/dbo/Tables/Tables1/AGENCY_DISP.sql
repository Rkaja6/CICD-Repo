CREATE TABLE [dbo].[AGENCY_DISP] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CODE]        VARCHAR (4)   NULL,
    [CODE_DESC]   VARCHAR (49)  NULL,
    [PROD_CAT]    VARCHAR (4)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

