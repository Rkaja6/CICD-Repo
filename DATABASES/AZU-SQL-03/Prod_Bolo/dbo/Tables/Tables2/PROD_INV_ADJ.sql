CREATE TABLE [dbo].[PROD_INV_ADJ] (
    [u2_id]                VARCHAR (255)   NOT NULL,
    [FROM_PROD_FAC_PRD_ID] VARCHAR (20)    NULL,
    [FROM_TANK]            VARCHAR (6)     NULL,
    [TERMINAL_NODE]        VARCHAR (8)     NULL,
    [TO_PROD_FAC_PRD_ID]   VARCHAR (20)    NULL,
    [TO_TANK]              VARCHAR (10)    NULL,
    [TRANSFER_DATE]        DATETIME        NULL,
    [TRANSFER_VOLUME]      NUMERIC (19, 2) NULL,
    [time_stamp]           DATETIME        NULL,
    [u2_checksum]          VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

