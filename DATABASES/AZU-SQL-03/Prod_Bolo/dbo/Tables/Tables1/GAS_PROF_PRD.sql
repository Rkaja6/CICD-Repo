CREATE TABLE [dbo].[GAS_PROF_PRD] (
    [GAS_PROF_PRD_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [PRDS]            VARCHAR (9)   NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([GAS_PROF_PRD_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GAS_PROF_PRD_u2_id_in]
    ON [dbo].[GAS_PROF_PRD]([u2_id] ASC);

