CREATE TABLE [dbo].[DIV_ASSEM] (
    [u2_id]               VARCHAR (255)   NOT NULL,
    [COMPANY]             VARCHAR (3)     NULL,
    [COST_CENTER]         VARCHAR (6)     NULL,
    [EFF_DATE]            DATETIME        NULL,
    [MDECK_ID]            VARCHAR (7)     NULL,
    [TOTAL_ACRES_ENTERED] NUMERIC (19, 4) NULL,
    [TYPE]                VARCHAR (4)     NULL,
    [time_stamp]          DATETIME        NULL,
    [u2_checksum]         VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

