CREATE TABLE [dbo].[CDX_SYS] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [CDX_CO_ID]    VARCHAR (7)   NULL,
    [DFLT_SEV_CPT] VARCHAR (11)  NULL,
    [RCV_CDX]      VARCHAR (3)   NULL,
    [SEND_CDX]     VARCHAR (4)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

