CREATE TABLE [dbo].[OFP_PROP_ALLOC] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [ALLOCATION_TYPE] VARCHAR (5)   NULL,
    [COMPANY]         VARCHAR (3)   NULL,
    [CONTRACT]        VARCHAR (10)  NULL,
    [PRODUCT]         VARCHAR (3)   NULL,
    [PROPERTY]        VARCHAR (7)   NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

