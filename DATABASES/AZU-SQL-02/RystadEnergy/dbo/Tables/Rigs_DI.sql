CREATE TABLE [dbo].[Rigs_DI] (
    [RigID]                      INT              NULL,
    [API10]                      NVARCHAR (255)   NULL,
    [PermitNumber]               NVARCHAR (255)   NULL,
    [OFSRegion]                  NVARCHAR (255)   NULL,
    [ContractorName]             NVARCHAR (255)   NULL,
    [RigNameNumber]              NVARCHAR (255)   NULL,
    [SpudDate]                   DATETIME         NULL,
    [DICountyParishName]         NVARCHAR (255)   NULL,
    [DIStateProvinceName]        NVARCHAR (255)   NULL,
    [DIStateProvinceCode]        NVARCHAR (255)   NULL,
    [DICountryName]              NVARCHAR (255)   NULL,
    [DICountryCode]              NVARCHAR (255)   NULL,
    [DIBasin]                    NVARCHAR (255)   NULL,
    [DIPlay]                     NVARCHAR (255)   NULL,
    [DISubPlay]                  NVARCHAR (255)   NULL,
    [OperatorCompanyName]        NVARCHAR (255)   NULL,
    [OperatorTicker]             NVARCHAR (255)   NULL,
    [ReportedOperator]           NVARCHAR (255)   NULL,
    [OperatorAlias]              NVARCHAR (255)   NULL,
    [PermitType]                 NVARCHAR (255)   NULL,
    [WellType]                   NVARCHAR (255)   NULL,
    [DrillType]                  NVARCHAR (255)   NULL,
    [Section]                    NVARCHAR (255)   NULL,
    [Township]                   NVARCHAR (255)   NULL,
    [Range]                      NVARCHAR (255)   NULL,
    [Block]                      NVARCHAR (255)   NULL,
    [Survey]                     NVARCHAR (255)   NULL,
    [Abstract]                   NVARCHAR (255)   NULL,
    [PermitPostedDate]           NVARCHAR (255)   NULL,
    [PermitApprovedDate]         NVARCHAR (255)   NULL,
    [PermitOriginalApprovedDate] NVARCHAR (255)   NULL,
    [PermitAmendedDate]          NVARCHAR (255)   NULL,
    [CreatedDate]                DATETIME         NULL,
    [UpdatedDate]                DATETIME         NULL,
    [DeletedDate]                NVARCHAR (255)   NULL,
    [DrawWorks]                  NVARCHAR (255)   NULL,
    [RatedHP]                    NVARCHAR (255)   NULL,
    [RatedWaterDepth]            NVARCHAR (255)   NULL,
    [PowerType]                  NVARCHAR (255)   NULL,
    [Mobility]                   NVARCHAR (255)   NULL,
    [LandOffshore]               NVARCHAR (255)   NULL,
    [District]                   NVARCHAR (255)   NULL,
    [LeaseName]                  NVARCHAR (255)   NULL,
    [WellNumber]                 NVARCHAR (255)   NULL,
    [PermitDepth]                NVARCHAR (255)   NULL,
    [TrueVerticalDepth]          NVARCHAR (255)   NULL,
    [Field]                      NVARCHAR (255)   NULL,
    [Formation]                  NVARCHAR (255)   NULL,
    [FormationDepth]             NVARCHAR (255)   NULL,
    [ContractorContact]          NVARCHAR (255)   NULL,
    [ContractorPhone]            NVARCHAR (255)   NULL,
    [ContractorAddress]          NVARCHAR (255)   NULL,
    [ContractorCity]             NVARCHAR (255)   NULL,
    [ContractorState]            NVARCHAR (255)   NULL,
    [ContractorZip]              NVARCHAR (255)   NULL,
    [ContractorEmail]            NVARCHAR (255)   NULL,
    [ContractorWebsite]          NVARCHAR (255)   NULL,
    [OperatorContact]            NVARCHAR (255)   NULL,
    [OperatorPhone]              NVARCHAR (255)   NULL,
    [OperatorAddress]            NVARCHAR (255)   NULL,
    [OperatorCity]               NVARCHAR (255)   NULL,
    [OperatorState]              NVARCHAR (255)   NULL,
    [OperatorZip]                NVARCHAR (255)   NULL,
    [MajorCity30mi]              NVARCHAR (255)   NULL,
    [MajorCity50mi]              NVARCHAR (255)   NULL,
    [H2SArea]                    NVARCHAR (255)   NULL,
    [RigLatitudeWGS84]           DECIMAL (28, 10) NULL,
    [RigLongitudeWGS84]          DECIMAL (28, 10) NULL,
    [PermitLatitudeWGS84]        NVARCHAR (255)   NULL,
    [PermitLongitudeWGS84]       NVARCHAR (255)   NULL,
    [PermitBHLatitudeWGS84]      NVARCHAR (255)   NULL,
    [PermitBHLongitudeWGS84]     NVARCHAR (255)   NULL,
    [TemporaryLocation]          NVARCHAR (255)   NULL,
    [DirectionsToLocation]       NVARCHAR (4000)  NULL,
    [DataSource]                 NVARCHAR (255)   NULL
);

