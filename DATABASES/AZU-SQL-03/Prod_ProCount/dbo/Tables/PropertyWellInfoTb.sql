﻿CREATE TABLE [dbo].[PropertyWellInfoTb] (
    [PropertyWellMerrickID]       INT              NOT NULL,
    [PropertyNumber]              VARCHAR (20)     NULL,
    [WellNumber]                  VARCHAR (20)     NULL,
    [DateWellSold]                DATETIME         NULL,
    [SalesCode]                   INT              NULL,
    [DateWellAcquired]            DATETIME         NULL,
    [AcquisitionCode]             INT              NULL,
    [DateAbandoned]               DATETIME         NULL,
    [WellType]                    INT              NULL,
    [WellName]                    VARCHAR (60)     NULL,
    [ShortName]                   VARCHAR (15)     NULL,
    [ProducingStatus]             INT              NULL,
    [ProducingMethod]             INT              NULL,
    [WellStatus]                  INT              NULL,
    [WellFluidType]               INT              NULL,
    [WellFlowDirection]           INT              NULL,
    [WellPurpose]                 INT              NULL,
    [WellOutcome]                 INT              NULL,
    [NoOfCompletion]              INT              NULL,
    [OutsideOperatedFlag]         INT              NULL,
    [FlashMonthOffset]            INT              NULL,
    [OriginalUnitWellMerrickID]   INT              NULL,
    [UnitsTypeFlag]               INT              NULL,
    [DirectionalSurveyReference]  VARCHAR (200)    NULL,
    [WellBoreDiagramReference]    VARCHAR (200)    NULL,
    [StateID]                     INT              NULL,
    [CountyID]                    INT              NULL,
    [CountryID]                   INT              NULL,
    [OffshoreFlag]                INT              NULL,
    [LegalDescription]            VARCHAR (40)     NULL,
    [Abstract]                    VARCHAR (12)     NULL,
    [Section]                     VARCHAR (12)     NULL,
    [One4Section]                 VARCHAR (4)      NULL,
    [One4OfOne4]                  VARCHAR (4)      NULL,
    [Township]                    VARCHAR (40)     NULL,
    [Range]                       VARCHAR (12)     NULL,
    [Survey]                      VARCHAR (40)     NULL,
    [Block]                       VARCHAR (12)     NULL,
    [SchoolDistrict]              VARCHAR (12)     NULL,
    [Basin]                       VARCHAR (14)     NULL,
    [Area]                        VARCHAR (14)     NULL,
    [Battery]                     VARCHAR (14)     NULL,
    [SubBattery]                  VARCHAR (14)     NULL,
    [MapCoordinateX]              FLOAT (53)       NULL,
    [MapCoordinateY]              FLOAT (53)       NULL,
    [UnitLetter]                  VARCHAR (1)      NULL,
    [Unit]                        VARCHAR (12)     NULL,
    [LegalSubdivision]            VARCHAR (12)     NULL,
    [Parish]                      VARCHAR (12)     NULL,
    [Track]                       VARCHAR (12)     NULL,
    [PrincipalMeridian]           VARCHAR (12)     NULL,
    [MapReference]                VARCHAR (40)     NULL,
    [Latitude]                    VARCHAR (12)     NULL,
    [Longitude]                   VARCHAR (12)     NULL,
    [LatitudeSurface]             FLOAT (53)       NULL,
    [LongitudeSurface]            FLOAT (53)       NULL,
    [LatitudeBottomHole]          FLOAT (53)       NULL,
    [LongitudeBottomHole]         FLOAT (53)       NULL,
    [Elevation]                   FLOAT (53)       NULL,
    [UWI]                         VARCHAR (30)     NULL,
    [UWIDisplay]                  VARCHAR (30)     NULL,
    [UWIType]                     INT              NULL,
    [Acreage]                     FLOAT (53)       NULL,
    [Directions]                  VARCHAR (500)    NULL,
    [ApiWellNumber]               VARCHAR (14)     NULL,
    [ReserveSettingBookYear]      DATETIME         NULL,
    [FirstOilSales]               DATETIME         NULL,
    [FirstGasSales]               DATETIME         NULL,
    [JointOperAgreementDate]      DATETIME         NULL,
    [JointOperAgreementType]      VARCHAR (10)     NULL,
    [SpudDate]                    DATETIME         NULL,
    [DateTotalDepthReached]       DATETIME         NULL,
    [TotalDepth]                  FLOAT (53)       NULL,
    [TargetDepth]                 FLOAT (53)       NULL,
    [TrueVerticalDepth]           FLOAT (53)       NULL,
    [PlugBackTotalDepth]          FLOAT (53)       NULL,
    [PlugBackVerticalDepth]       FLOAT (53)       NULL,
    [KellyBushingLevel]           FLOAT (53)       NULL,
    [DateCompleted]               DATETIME         NULL,
    [DateOfInitialProductionOil]  DATETIME         NULL,
    [DateOfInitialProductionGas]  DATETIME         NULL,
    [DateOfPlugAbandon]           DATETIME         NULL,
    [SPCCPlanDate]                DATETIME         NULL,
    [RigReleaseDate]              DATETIME         NULL,
    [UserNumber1]                 FLOAT (53)       NULL,
    [UserNumber1Label]            VARCHAR (30)     NULL,
    [UserNumber2]                 FLOAT (53)       NULL,
    [UserNumber2Label]            VARCHAR (30)     NULL,
    [UserNumber3]                 FLOAT (53)       NULL,
    [UserNumber3Label]            VARCHAR (30)     NULL,
    [UserNumber4]                 FLOAT (53)       NULL,
    [UserNumber4Label]            VARCHAR (30)     NULL,
    [UserNumber5]                 FLOAT (53)       NULL,
    [UserNumber5Label]            VARCHAR (30)     NULL,
    [UserNumber6]                 FLOAT (53)       NULL,
    [UserNumber6Label]            VARCHAR (30)     NULL,
    [UserStringA]                 VARCHAR (100)    NULL,
    [UserStringALabel]            VARCHAR (30)     NULL,
    [UserStringB]                 VARCHAR (100)    NULL,
    [UserStringBLabel]            VARCHAR (30)     NULL,
    [UserStringC]                 VARCHAR (100)    NULL,
    [UserStringCLabel]            VARCHAR (30)     NULL,
    [UserStringD]                 VARCHAR (100)    NULL,
    [UserStringDLabel]            VARCHAR (30)     NULL,
    [UserStringE]                 VARCHAR (100)    NULL,
    [UserStringELabel]            VARCHAR (30)     NULL,
    [UserStringF]                 VARCHAR (100)    NULL,
    [UserStringFLabel]            VARCHAR (30)     NULL,
    [GatheringSystemID]           INT              NULL,
    [ProspectID]                  INT              NULL,
    [ProjectNumber]               VARCHAR (14)     NULL,
    [SuperPersonID]               INT              NULL,
    [ForemanPersonID]             INT              NULL,
    [PumperPersonID]              INT              NULL,
    [EngineerPersonID]            INT              NULL,
    [AccountantPersonID]          INT              NULL,
    [OperatorEntityID]            INT              NULL,
    [OperatorEntityLoc]           INT              NULL,
    [AccountingTeamID]            INT              NULL,
    [DrillingTeamID]              INT              NULL,
    [ProductionTeamID]            INT              NULL,
    [GroupID]                     INT              NULL,
    [DivisionID]                  INT              NULL,
    [FieldGroupID]                INT              NULL,
    [AreaID]                      INT              NULL,
    [PlatformID]                  INT              NULL,
    [BatteryID]                   INT              NULL,
    [LeaseID]                     INT              NULL,
    [DDAID]                       INT              NULL,
    [UnitID]                      INT              NULL,
    [AccountingID]                VARCHAR (40)     NULL,
    [ProductionID]                VARCHAR (40)     NULL,
    [EngineeringID]               VARCHAR (40)     NULL,
    [ScadaID]                     VARCHAR (40)     NULL,
    [AccountingUploadFlag]        INT              NULL,
    [EngineeringUploadFlag]       INT              NULL,
    [SupplyTrackingFlag]          INT              NULL,
    [WellViewID]                  VARCHAR (40)     NULL,
    [ActiveFlag]                  INT              NULL,
    [StartActiveDate]             DATETIME         NULL,
    [EndActiveDate]               DATETIME         NULL,
    [TemplateRecordFlag]          INT              NULL,
    [TemplateRecordUsed]          INT              NULL,
    [AfterCasingPointBillDeck]    INT              NULL,
    [BeforeCasingPointBillDeck]   INT              NULL,
    [CompletionChildCount]        INT              NULL,
    [InternalReferenceNumber]     VARCHAR (20)     NULL,
    [PrintFlag]                   INT              NULL,
    [DeleteFlag]                  INT              NULL,
    [DateTimeStamp]               DATETIME         NULL,
    [BLogicDateStamp]             DATETIME         NULL,
    [BLogicTimeStamp]             CHAR (8)         NULL,
    [UserDateStamp]               DATETIME         NULL,
    [UserTimeStamp]               CHAR (8)         NULL,
    [UserID]                      INT              NULL,
    [DataBaseVersionNumberExtBld] INT              NULL,
    [AccountingShortName]         VARCHAR (30)     NULL,
    [DataSourceCode]              INT              NULL,
    [RowUID]                      UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_PropertyWellInfoTb] PRIMARY KEY CLUSTERED ([PropertyWellMerrickID] ASC)
);

