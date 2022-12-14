CREATE TABLE [dbo].[TRACT_TGS_MAP] (
    [TRACT_TGS_MAP_ID]   VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [LOC]                VARCHAR (25)  NULL,
    [TGS_RANGES_DIRS]    VARCHAR (6)   NULL,
    [TGS_RANGES_NOS]     VARCHAR (6)   NULL,
    [TGS_TOWNSHIPS_DIRS] VARCHAR (6)   NULL,
    [TGS_TOWNSHIPS_NOS]  VARCHAR (6)   NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([TRACT_TGS_MAP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRACT_TGS_MAP_u2_id_in]
    ON [dbo].[TRACT_TGS_MAP]([u2_id] ASC);

