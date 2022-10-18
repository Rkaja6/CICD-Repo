CREATE TABLE [dbo].[WELL_DOWN_DOWN_HOURS] (
    [WELL_DOWN_DOWN_HOURS_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                   VARCHAR (255)   NULL,
    [BEGIN_DOWN_DATES]        DATETIME        NULL,
    [COMMENTS]                VARCHAR (35)    NULL,
    [DOWN_DATES]              DATETIME        NULL,
    [DOWN_HOURS]              NUMERIC (19, 2) NULL,
    [DOWN_REASONS]            VARCHAR (6)     NULL,
    [ENDING_DOWN_DATES]       DATETIME        NULL,
    [TYPES]                   VARCHAR (12)    NULL,
    [UP_DATES]                DATETIME        NULL,
    [time_stamp]              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([WELL_DOWN_DOWN_HOURS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_DOWN_DOWN_HOURS_u2_id_in]
    ON [dbo].[WELL_DOWN_DOWN_HOURS]([u2_id] ASC);

