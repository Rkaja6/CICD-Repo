CREATE TABLE [dbo].[PROJLOG] (
    [u2_id]         VARCHAR (255)  NOT NULL,
    [DELIVERY_NOTE] VARCHAR (1370) NULL,
    [time_stamp]    DATETIME       NULL,
    [u2_checksum]   VARCHAR (25)   NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

