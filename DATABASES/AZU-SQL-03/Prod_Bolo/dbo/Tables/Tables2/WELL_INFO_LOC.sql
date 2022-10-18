CREATE TABLE [dbo].[WELL_INFO_LOC] (
    [WELL_INFO_LOC_ID] VARCHAR (255)   NOT NULL,
    [u2_id]            VARCHAR (255)   NULL,
    [LOC_FTS]          NUMERIC (19, 2) NULL,
    [LOC_SURVEYS]      VARCHAR (6)     NULL,
    [time_stamp]       DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([WELL_INFO_LOC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_INFO_LOC_u2_id_in]
    ON [dbo].[WELL_INFO_LOC]([u2_id] ASC);

