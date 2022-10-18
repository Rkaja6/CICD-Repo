CREATE TABLE [dbo].[TANK] (
    [u2_id]         VARCHAR (255)   NOT NULL,
    [CAPACITY]      NUMERIC (19, 2) NULL,
    [CERTIFIED_BY]  VARCHAR (9)     NULL,
    [COMPANY]       VARCHAR (2)     NULL,
    [DESCRIPTION]   VARCHAR (33)    NULL,
    [DISP]          VARCHAR (4)     NULL,
    [ID_CNV]        NUMERIC (9)     NULL,
    [MMS_ID]        VARCHAR (10)    NULL,
    [MODEL]         VARCHAR (5)     NULL,
    [PROPERTY]      VARCHAR (15)    NULL,
    [SEAL]          VARCHAR (8)     NULL,
    [STATE_ID]      VARCHAR (8)     NULL,
    [TANK_NO]       VARCHAR (14)    NULL,
    [TANK_TABLE_ID] VARCHAR (16)    NULL,
    [time_stamp]    DATETIME        NULL,
    [u2_checksum]   VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

