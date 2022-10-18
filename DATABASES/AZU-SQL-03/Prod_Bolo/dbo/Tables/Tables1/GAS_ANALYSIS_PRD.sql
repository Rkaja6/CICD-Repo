CREATE TABLE [dbo].[GAS_ANALYSIS_PRD] (
    [GAS_ANALYSIS_PRD_ID] VARCHAR (255)   NOT NULL,
    [u2_id]               VARCHAR (255)   NULL,
    [GPMS]                NUMERIC (19, 3) NULL,
    [PRDS]                VARCHAR (8)     NULL,
    [PRD_PERCENTS]        NUMERIC (19, 3) NULL,
    [time_stamp]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([GAS_ANALYSIS_PRD_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GAS_ANALYSIS_PRD_u2_id_in]
    ON [dbo].[GAS_ANALYSIS_PRD]([u2_id] ASC);

