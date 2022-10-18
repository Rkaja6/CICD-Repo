CREATE TABLE [dbo].[PRD_EQUIP_ALLOC] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [DISPS]         VARCHAR (126) NULL,
    [PROD_UI_COORD] VARCHAR (6)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

