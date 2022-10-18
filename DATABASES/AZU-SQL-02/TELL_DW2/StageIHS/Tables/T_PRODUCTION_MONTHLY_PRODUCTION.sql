CREATE TABLE [StageIHS].[T_PRODUCTION_MONTHLY_PRODUCTION] (
    [ENTITY]                 VARCHAR (200)   NOT NULL,
    [SOURCE]                 VARCHAR (200)   NOT NULL,
    [IDX]                    INT             IDENTITY (1, 1) NOT NULL,
    [ENTITY_TYPE]            VARCHAR (350)   NULL,
    [PRIMARY_PRODUCT]        VARCHAR (350)   NULL,
    [LEASE_NAME]             VARCHAR (350)   NULL,
    [WELL_NUMBER]            VARCHAR (350)   NULL,
    [API]                    VARCHAR (20)    NOT NULL,
    [REGULATORY_API]         VARCHAR (350)   NULL,
    [YEAR]                   INT             NOT NULL,
    [MONTH]                  VARCHAR (50)    NOT NULL,
    [LIQUID]                 DECIMAL (14, 4) NULL,
    [GAS]                    DECIMAL (14, 4) NULL,
    [WATER]                  DECIMAL (14, 4) NULL,
    [RATIO_GAS_OIL]          DECIMAL (14, 4) NULL,
    [PERCENT_WATER]          DECIMAL (14, 4) NULL,
    [WELLS]                  INT             NULL,
    [DAYS_ON]                INT             NULL,
    [CADIS_SYSTEM_INSERTED]  DATETIME        NULL,
    [CADIS_SYSTEM_UPDATED]   DATETIME        NULL,
    [CADIS_SYSTEM_CHANGEDBY] NVARCHAR (350)  NULL,
    [CADIS_SYSTEM_RUNID]     INT             NULL,
    [CADIS_SYSTEM_TOPRUNID]  INT             NULL,
    CONSTRAINT [PK_T_PRODUCTION_MONTHLY_PRODUCTION] PRIMARY KEY CLUSTERED ([ENTITY] ASC, [SOURCE] ASC, [API] ASC, [YEAR] ASC, [MONTH] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_IHSPRODUCTION_API_YEAR_MONTH_ENTITYTYPE]
    ON [StageIHS].[T_PRODUCTION_MONTHLY_PRODUCTION]([API] ASC, [YEAR] ASC, [MONTH] ASC, [ENTITY_TYPE] ASC);

