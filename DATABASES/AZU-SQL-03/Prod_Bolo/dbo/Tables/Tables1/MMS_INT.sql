CREATE TABLE [dbo].[MMS_INT] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [TMP_PMT_DATE]  DATETIME      NULL,
    [TMP_SALE_DATE] DATETIME      NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

