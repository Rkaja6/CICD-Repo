CREATE TABLE [StageDI].[TreatmentJobs] (
    [TreatmentJobID]              BIGINT         NULL,
    [CompletionID]                BIGINT         NULL,
    [WellID]                      BIGINT         NULL,
    [WellboreID]                  BIGINT         NULL,
    [GovernmentID]                BIGINT         NULL,
    [StateProvince]               VARCHAR (258)  NULL,
    [County]                      VARCHAR (171)  NULL,
    [UpdatedDate]                 DATETIME       NULL,
    [DeletedDate]                 DATETIME       NULL,
    [CreatedDate]                 DATETIME       NULL,
    [TreatmentTop]                VARCHAR (102)  NULL,
    [TreatmentBottom]             VARCHAR (102)  NULL,
    [TreatmentSequence]           VARCHAR (114)  NULL,
    [StageCount]                  VARCHAR (102)  NULL,
    [TotalFluidGal]               VARCHAR (54)   NULL,
    [TotalProppantlbs]            VARCHAR (114)  NULL,
    [TotalAdditiveGal]            VARCHAR (78)   NULL,
    [TotalAdditivelbs]            VARCHAR (57)   NULL,
    [OpenHole]                    VARCHAR (114)  NULL,
    [InitialFluidDensity]         VARCHAR (78)   NULL,
    [MinFractureGradient]         VARCHAR (78)   NULL,
    [RecoveredFlowback]           VARCHAR (111)  NULL,
    [AverageRate]                 VARCHAR (48)   NULL,
    [AveragePressure]             VARCHAR (36)   NULL,
    [MinRate]                     VARCHAR (111)  NULL,
    [MaxRate]                     VARCHAR (42)   NULL,
    [MaxPressure]                 VARCHAR (51)   NULL,
    [BreakdownPressure]           VARCHAR (111)  NULL,
    [ShutinPressure]              VARCHAR (45)   NULL,
    [TotalBasedWatervolumeGal]    VARCHAR (39)   NULL,
    [TotalBasedNonWatervolumeGal] VARCHAR (114)  NULL,
    [PreFracCSGPSI]               VARCHAR (33)   NULL,
    [AcidConcentration]           VARCHAR (5)    NULL,
    [StartDate]                   DATETIME       NULL,
    [EndDate]                     DATETIME       NULL,
    [Source]                      VARCHAR (36)   NULL,
    [TreatmentType]               VARCHAR (53)   NULL,
    [TreatmentFormation]          VARCHAR (100)  NULL,
    [TreatmentGasType]            VARCHAR (39)   NULL,
    [FracProvider]                VARCHAR (51)   NULL,
    [ReportedContractorName]      VARCHAR (MAX)  NULL,
    [FlowbackDisposalMethod]      VARCHAR (8)    NULL,
    [Remarks]                     VARCHAR (8000) NULL,
    [GreenTechniques]             VARCHAR (1278) NULL,
    [RemarkGreenTechniques]       VARCHAR (1107) NULL,
    [FracTechnique]               VARCHAR (699)  NULL,
    [RemarkFracTechnique]         VARCHAR (612)  NULL,
    [Region]                      VARCHAR (486)  NULL,
    [Country]                     VARCHAR (477)  NULL,
    [Field]                       VARCHAR (483)  NULL,
    [BasinName]                   VARCHAR (474)  NULL,
    [District]                    VARCHAR (978)  NULL
);

