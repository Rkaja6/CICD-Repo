CREATE TABLE [dbo].[RECON_TAX] (
    [u2_id]                VARCHAR (255)   NOT NULL,
    [COMPANY]              VARCHAR (3)     NULL,
    [GROSS_VALUE_OGP3317]  NUMERIC (19, 2) NULL,
    [GROSS_VALUE_RR3301]   NUMERIC (19, 2) NULL,
    [GROSS_VALUE_RR3305]   NUMERIC (19, 2) NULL,
    [GROSS_VALUE_RR3317CO] NUMERIC (19, 2) NULL,
    [PROPERTY]             VARCHAR (15)    NULL,
    [REFERENCE]            VARCHAR (10)    NULL,
    [STATE]                VARCHAR (3)     NULL,
    [time_stamp]           DATETIME        NULL,
    [u2_checksum]          VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

