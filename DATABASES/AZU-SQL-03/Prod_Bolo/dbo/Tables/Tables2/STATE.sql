CREATE TABLE [dbo].[STATE] (
    [u2_id]                 VARCHAR (255)   NOT NULL,
    [ACRES_TO_HECTARE]      NUMERIC (19, 4) NULL,
    [API_CODE]              VARCHAR (4)     NULL,
    [COUNTRY]               VARCHAR (6)     NULL,
    [IRS_COMBINED_CODE]     VARCHAR (4)     NULL,
    [IRS_COMBINED_ELIGIBLE] VARCHAR (4)     NULL,
    [NAME]                  VARCHAR (25)    NULL,
    [PRESSURE_BASE]         NUMERIC (19, 3) NULL,
    [time_stamp]            DATETIME        NULL,
    [u2_checksum]           VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

