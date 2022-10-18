CREATE TABLE [dbo].[TRACT_DEPTH] (
    [TRACT_DEPTH_ID]            VARCHAR (255) NOT NULL,
    [u2_id]                     VARCHAR (255) NULL,
    [DEPTH_RESTRICTIONS]        VARCHAR (79)  NULL,
    [DEPTH_RESTRICTIONS_CUSTOM] VARCHAR (79)  NULL,
    [FROM_DEPTHS]               VARCHAR (6)   NULL,
    [FROM_FORMATIONS]           VARCHAR (9)   NULL,
    [FROM_REFERENCES]           VARCHAR (7)   NULL,
    [TO_DEPTHS]                 VARCHAR (7)   NULL,
    [TO_FORMATIONS]             VARCHAR (9)   NULL,
    [TO_REFERENCES]             VARCHAR (6)   NULL,
    [time_stamp]                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([TRACT_DEPTH_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRACT_DEPTH_u2_id_in]
    ON [dbo].[TRACT_DEPTH]([u2_id] ASC);

