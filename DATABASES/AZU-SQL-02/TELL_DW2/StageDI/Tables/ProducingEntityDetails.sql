CREATE TABLE [StageDI].[ProducingEntityDetails] (
    [EntityId]              INT            NOT NULL,
    [PdenProdId]            INT            NULL,
    [ApiNo]                 VARCHAR (30)   NOT NULL,
    [ProdDate]              DATETIME       NOT NULL,
    [CreatedDate]           DATETIME       NULL,
    [UpdatedDate]           DATETIME       NULL,
    [DeletedDate]           DATETIME       NULL,
    [AverageDailyGas]       REAL           NULL,
    [AverageDailyWater]     REAL           NULL,
    [AverageDailyOil]       REAL           NULL,
    [Liq]                   INT            NULL,
    [Gas]                   INT            NULL,
    [Wtr]                   INT            NULL,
    [Wcnt]                  SMALLINT       NULL,
    [Days]                  SMALLINT       NULL,
    [ProdMonthNo]           SMALLINT       NULL,
    [ApiList]               VARCHAR (8000) NULL,
    [LiqAllocationMethod]   VARCHAR (45)   NULL,
    [GasAllocationMethod]   VARCHAR (39)   NULL,
    [WaterAllocationMethod] VARCHAR (39)   NULL,
    [WellCount]             VARCHAR (39)   NULL,
    [Source]                VARCHAR (39)   NULL,
    [SourceKey]             BIGINT         NULL,
    [IsDeleted]             VARCHAR (39)   NULL,
    [TellurianUpdatedDate]  DATETIME       NULL,
    CONSTRAINT [PK_ProducingEntityDetails] PRIMARY KEY CLUSTERED ([EntityId] ASC, [ApiNo] ASC, [ProdDate] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_ProducingEntityDetails_ApiNo_DeletedDate]
    ON [StageDI].[ProducingEntityDetails]([ApiNo] ASC, [DeletedDate] ASC);

