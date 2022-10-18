CREATE TABLE [dbo].[OG_RESERVE_ADJDET] (
    [OG_RESERVE_ADJDET_ID]  VARCHAR (255)   NOT NULL,
    [u2_id]                 VARCHAR (255)   NULL,
    [ADJ_COMMENTS]          VARCHAR (30)    NULL,
    [ADJ_DATES]             DATETIME        NULL,
    [ADJ_EXPLANATION_CODES] VARCHAR (10)    NULL,
    [DEV_GAS]               NUMERIC (19, 2) NULL,
    [DEV_NGL]               NUMERIC (19, 2) NULL,
    [DEV_OIL]               NUMERIC (19, 2) NULL,
    [UNDEV_GAS]             NUMERIC (19, 2) NULL,
    [UNDEV_NGL]             NUMERIC (19, 2) NULL,
    [UNDEV_OIL]             NUMERIC (19, 2) NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([OG_RESERVE_ADJDET_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_RESERVE_ADJDET_u2_id_in]
    ON [dbo].[OG_RESERVE_ADJDET]([u2_id] ASC);

