CREATE TABLE [dbo].[PRD_FLOW_CTL] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [PROD_FAC_PRD_ID] VARCHAR (15)  NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

