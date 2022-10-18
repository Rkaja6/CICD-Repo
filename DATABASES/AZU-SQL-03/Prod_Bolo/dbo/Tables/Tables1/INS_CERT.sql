CREATE TABLE [dbo].[INS_CERT] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CONTACT]     VARCHAR (107) NULL,
    [EP_DATE]     DATETIME      NULL,
    [INS_EXHIBIT] VARCHAR (7)   NULL,
    [MSA_DATE]    DATETIME      NULL,
    [MSA_STATUS]  VARCHAR (6)   NULL,
    [VENDOR_SRV]  VARCHAR (4)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

