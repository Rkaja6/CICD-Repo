CREATE TABLE [dbo].[PRR_CA_EFF_DT] (
    [PRR_CA_EFF_DT_ID]        VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [EFF_DATES]               DATETIME      NULL,
    [INJECTION_WATER_SOURCES] VARCHAR (6)   NULL,
    [INJECTION_WATER_TYPES]   VARCHAR (5)   NULL,
    [STATE_METHODS]           VARCHAR (9)   NULL,
    [WELL_TYPES]              VARCHAR (4)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRR_CA_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRR_CA_EFF_DT_u2_id_in]
    ON [dbo].[PRR_CA_EFF_DT]([u2_id] ASC);

