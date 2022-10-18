CREATE TABLE [dbo].[WELL_INFO_MMS] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [API_NO]         VARCHAR (15)    NULL,
    [PRODUCT]        VARCHAR (4)     NULL,
    [SALE_MONTH_LAG] VARCHAR (3)     NULL,
    [TOTAL_ENTERED]  NUMERIC (19, 8) NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

