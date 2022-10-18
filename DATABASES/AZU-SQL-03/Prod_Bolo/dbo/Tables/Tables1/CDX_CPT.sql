CREATE TABLE [dbo].[CDX_CPT] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CPT]         VARCHAR (6)   NULL,
    [DESCRIPTION] VARCHAR (85)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

