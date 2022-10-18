CREATE TABLE [dbo].[PTRSHP_CHK_INSERT] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [CHECK_PRINTED] VARCHAR (7)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

