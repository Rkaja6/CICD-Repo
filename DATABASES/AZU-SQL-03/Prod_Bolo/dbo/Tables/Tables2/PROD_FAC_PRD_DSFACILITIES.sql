CREATE TABLE [dbo].[PROD_FAC_PRD_DSFACILITIES] (
    [subValueId]                                VARCHAR (255) NOT NULL,
    [PROD_FAC_PRD_DOWNSTREAM_ID]                VARCHAR (255) NULL,
    [BTU_FACTOR_EFF_DATES]                      VARCHAR (10)  NULL,
    [DOWNSTREAM_ALLOC_METHODS]                  VARCHAR (6)   NULL,
    [DOWNSTREAM_CONNECTION_PRODUCES_GAS_LIFTS]  VARCHAR (10)  NULL,
    [DOWNSTREAM_CONNECTION_PRODUCES_INJECTIONS] VARCHAR (10)  NULL,
    [DOWNSTREAM_FACILITIES]                     VARCHAR (15)  NULL,
    [DOWNSTREAM_SUB_SYSTEMS]                    VARCHAR (10)  NULL,
    [DOWNSTREAM_VOL_METHODS]                    VARCHAR (10)  NULL,
    [time_stamp]                                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_FAC__PROD_FAC__26228]
    ON [dbo].[PROD_FAC_PRD_DSFACILITIES]([PROD_FAC_PRD_DOWNSTREAM_ID] ASC);

