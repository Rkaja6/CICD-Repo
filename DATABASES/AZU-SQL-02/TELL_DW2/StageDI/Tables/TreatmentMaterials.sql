CREATE TABLE [StageDI].[TreatmentMaterials] (
    [TreatmentMaterialUsageID]       INT            NULL,
    [TreatmentStageID]               INT            NULL,
    [TreatmentJobID]                 INT            NULL,
    [UpdatedDate]                    DATETIME       NULL,
    [DeletedDate]                    DATETIME       NULL,
    [StateProvince]                  VARCHAR (6)    NULL,
    [County]                         VARCHAR (39)   NULL,
    [CreatedDate]                    DATETIME       NULL,
    [PercenthighAdditiveReported]    VARCHAR (MAX)  NULL,
    [IngredientPercentHFJob]         VARCHAR (MAX)  NULL,
    [IngredientPercentHFJobReported] VARCHAR (MAX)  NULL,
    [IngredientDensityPPG]           VARCHAR (MAX)  NULL,
    [MaterialAmount]                 REAL           NULL,
    [Source]                         VARCHAR (36)   NULL,
    [TradeName]                      VARCHAR (MAX)  NULL,
    [Supplier]                       VARCHAR (MAX)  NULL,
    [MaterialType]                   VARCHAR (33)   NULL,
    [MaterialCategory]               VARCHAR (24)   NULL,
    [MaterialName]                   VARCHAR (72)   NULL,
    [MaterialUOM]                    VARCHAR (15)   NULL,
    [SandQuality]                    VARCHAR (39)   NULL,
    [ProppantMeshSize]               VARCHAR (24)   NULL,
    [ProppantSandClassification]     VARCHAR (36)   NULL,
    [AcidConcentration]              SMALLINT       NULL,
    [Cementclass]                    VARCHAR (3)    NULL,
    [CASNumber]                      VARCHAR (MAX)  NULL,
    [CASNumberReported]              VARCHAR (MAX)  NULL,
    [Remarks]                        VARCHAR (2000) NULL,
    [Region]                         VARCHAR (594)  NULL,
    [Country]                        VARCHAR (378)  NULL,
    [Field]                          VARCHAR (501)  NULL,
    [BasinName]                      VARCHAR (381)  NULL,
    [District]                       VARCHAR (270)  NULL
);


GO
CREATE NONCLUSTERED INDEX [idx_stagedi_treatmentmaterials_treatmentjobid]
    ON [StageDI].[TreatmentMaterials]([TreatmentJobID] ASC)
    INCLUDE([MaterialAmount], [MaterialType], [MaterialUOM], [ProppantSandClassification]) WITH (STATISTICS_NORECOMPUTE = ON);


GO
ALTER INDEX [idx_stagedi_treatmentmaterials_treatmentjobid]
    ON [StageDI].[TreatmentMaterials] DISABLE;

