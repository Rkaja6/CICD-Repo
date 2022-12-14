CREATE TABLE [dbo].[LSE_CTRC_TRACT_OFFSHORE] (
    [LSE_CTRC_TRACT_OFFSHORE_ID] VARCHAR (255) NOT NULL,
    [u2_id]                      VARCHAR (255) NULL,
    [OFFSHORE_AREAS]             VARCHAR (8)   NULL,
    [OFFSHORE_BLOCKS]            VARCHAR (5)   NULL,
    [OFFSHORE_DESCS]             VARCHAR (30)  NULL,
    [time_stamp]                 DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([LSE_CTRC_TRACT_OFFSHORE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LSE_CTRC__u2_id_78470]
    ON [dbo].[LSE_CTRC_TRACT_OFFSHORE]([u2_id] ASC);

