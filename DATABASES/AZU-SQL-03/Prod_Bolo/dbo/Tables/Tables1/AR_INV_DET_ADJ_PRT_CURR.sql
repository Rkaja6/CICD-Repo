CREATE TABLE [dbo].[AR_INV_DET_ADJ_PRT_CURR] (
    [subValueId]        VARCHAR (255)   NOT NULL,
    [AR_INV_DET_ADJ_ID] VARCHAR (255)   NULL,
    [CURR_AMTS]         NUMERIC (19, 2) NULL,
    [RPT_CURRS]         VARCHAR (4)     NULL,
    [time_stamp]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AR_INV_DE_AR_INV_DE_23450]
    ON [dbo].[AR_INV_DET_ADJ_PRT_CURR]([AR_INV_DET_ADJ_ID] ASC);

