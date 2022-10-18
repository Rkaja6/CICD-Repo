CREATE TABLE [dbo].[OBD_WELL_COUNT_WELL_ST] (
    [OBD_WELL_COUNT_WELL_ST_ID] VARCHAR (255) NOT NULL,
    [u2_id]                     VARCHAR (255) NULL,
    [COUNTS]                    VARCHAR (6)   NULL,
    [WELL_STATUS]               VARCHAR (10)  NULL,
    [time_stamp]                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OBD_WELL_COUNT_WELL_ST_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OBD_WELL__u2_id_75625]
    ON [dbo].[OBD_WELL_COUNT_WELL_ST]([u2_id] ASC);

