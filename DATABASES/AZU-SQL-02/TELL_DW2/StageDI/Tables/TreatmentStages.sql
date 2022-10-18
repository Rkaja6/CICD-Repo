﻿CREATE TABLE [StageDI].[TreatmentStages] (
    [TreatmentStageID]            VARCHAR (615)  NULL,
    [TreatmentJobID]              VARCHAR (267)  NULL,
    [UpdatedDate]                 DATETIME       NULL,
    [DeletedDate]                 DATETIME       NULL,
    [StateProvince]               VARCHAR (258)  NULL,
    [County]                      VARCHAR (117)  NULL,
    [CreatedDate]                 DATETIME       NULL,
    [StageNumber]                 VARCHAR (117)  NULL,
    [TreatmentTop]                VARCHAR (102)  NULL,
    [TreatmentBottom]             VARCHAR (114)  NULL,
    [TotalFluidGal]               VARCHAR (99)   NULL,
    [TotalProppantLbs]            VARCHAR (87)   NULL,
    [TotalAdditiveGal]            VARCHAR (87)   NULL,
    [TotalAdditiveLbs]            VARCHAR (75)   NULL,
    [AverageRate]                 VARCHAR (54)   NULL,
    [AveragePressure]             VARCHAR (63)   NULL,
    [MinRate]                     VARCHAR (87)   NULL,
    [MinPressure]                 VARCHAR (63)   NULL,
    [MaxRate]                     VARCHAR (90)   NULL,
    [MaxPressure]                 VARCHAR (75)   NULL,
    [BreakdownPressure]           VARCHAR (48)   NULL,
    [ShutinPressure]              VARCHAR (12)   NULL,
    [TotalbasedWaterVolumeGal]    VARCHAR (9)    NULL,
    [TotalbasednonWaterVolumeGal] VARCHAR (30)   NULL,
    [Source]                      VARCHAR (102)  NULL,
    [Remarks]                     VARCHAR (4655) NULL,
    [Region]                      VARCHAR (903)  NULL,
    [Country]                     VARCHAR (753)  NULL,
    [Field]                       VARCHAR (552)  NULL,
    [BasinName]                   VARCHAR (498)  NULL,
    [District]                    VARCHAR (453)  NULL
);

