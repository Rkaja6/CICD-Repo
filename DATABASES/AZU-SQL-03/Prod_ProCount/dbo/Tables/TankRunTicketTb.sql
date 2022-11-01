﻿CREATE TABLE [dbo].[TankRunTicketTb] (
    [MerrickID]                 INT              NOT NULL,
    [RecordDate]                DATETIME         NOT NULL,
    [RunTicketNumber]           VARCHAR (22)     NOT NULL,
    [DispositionCode]           INT              NULL,
    [RunOrDispositionFlag]      INT              NULL,
    [FluidDisposition]          INT              NULL,
    [Destination]               VARCHAR (40)     NULL,
    [DestinationObjectId]       INT              NULL,
    [DestinationObjectType]     INT              NULL,
    [OriginationObjectId]       INT              NULL,
    [OriginationObjectType]     INT              NULL,
    [SourceID]                  INT              NULL,
    [SourceType]                INT              NULL,
    [ProductCode]               INT              NULL,
    [ProductType]               INT              NULL,
    [OilWaterRunFlag]           INT              NULL,
    [DataSourceCode]            INT              NULL,
    [ActualEstimatedFlag]       INT              NULL,
    [RunTicketDate]             DATETIME         NULL,
    [RunOpenDate]               DATETIME         NULL,
    [RunOpenTime]               CHAR (8)         NULL,
    [RunCloseDate]              DATETIME         NULL,
    [RunCloseTime]              CHAR (8)         NULL,
    [AllocatedTicketFlag]       INT              NULL,
    [CommentID]                 INT              NULL,
    [PrimoSendFlag]             INT              NULL,
    [BSAndW]                    FLOAT (53)       NULL,
    [EmulsionPercent]           FLOAT (53)       NULL,
    [WaxPercent]                FLOAT (53)       NULL,
    [SaltContentPPM]            FLOAT (53)       NULL,
    [SulfurContentPPM]          FLOAT (53)       NULL,
    [WaterVaporContentPPM]      FLOAT (53)       NULL,
    [TankIsolatedFlag]          INT              NULL,
    [OpenOdometer]              FLOAT (53)       NULL,
    [CloseOdometer]             FLOAT (53)       NULL,
    [LactMeterFactor]           FLOAT (53)       NULL,
    [LactCompressibilityFactor] FLOAT (53)       NULL,
    [LactDensityCorrection]     FLOAT (53)       NULL,
    [OpenFeet]                  INT              NULL,
    [OpenInch]                  INT              NULL,
    [OpenQuarter]               FLOAT (53)       NULL,
    [BottomOpenFeet]            INT              NULL,
    [BottomOpenInch]            INT              NULL,
    [BottomOpenQuarter]         FLOAT (53)       NULL,
    [TopOpenTotalInches]        FLOAT (53)       NULL,
    [BottomOpenTotalInches]     FLOAT (53)       NULL,
    [TopCloseTotalInches]       FLOAT (53)       NULL,
    [BottomCloseTotalInches]    FLOAT (53)       NULL,
    [CloseFeet]                 INT              NULL,
    [CloseInch]                 INT              NULL,
    [CloseQuarter]              FLOAT (53)       NULL,
    [BottomCloseFeet]           INT              NULL,
    [BottomCloseInch]           INT              NULL,
    [BottomCloseQuarter]        FLOAT (53)       NULL,
    [OpenTemperature]           FLOAT (53)       NULL,
    [CloseTemperature]          FLOAT (53)       NULL,
    [ObservedTemperature]       FLOAT (53)       NULL,
    [ActualGravity]             FLOAT (53)       NULL,
    [ConvertedGravity]          FLOAT (53)       NULL,
    [ReidVaporPressure]         FLOAT (53)       NULL,
    [GrossBarrels]              FLOAT (53)       NULL,
    [NetBarrels]                FLOAT (53)       NULL,
    [NetWaterBarrels]           FLOAT (53)       NULL,
    [FreeWater]                 FLOAT (53)       NULL,
    [Hauler]                    INT              NULL,
    [HaulerLoc]                 INT              NULL,
    [HaulerTankID]              VARCHAR (20)     NULL,
    [HaulerReportedBarrels]     FLOAT (53)       NULL,
    [HaulerReportedNetBarrels]  FLOAT (53)       NULL,
    [UseHaulerBarrelsFlag]      INT              NULL,
    [HaulerStatementDate]       DATETIME         NULL,
    [WaterHauler]               INT              NULL,
    [GrossNGL]                  FLOAT (53)       NULL,
    [NetNGL]                    FLOAT (53)       NULL,
    [AllocatedNGL]              FLOAT (53)       NULL,
    [WaterCut]                  FLOAT (53)       NULL,
    [SandCut]                   FLOAT (53)       NULL,
    [AllocatedOilBarrels]       FLOAT (53)       NULL,
    [AllocatedWaterBarrels]     FLOAT (53)       NULL,
    [Purchaser]                 INT              NULL,
    [PurchaserLoc]              INT              NULL,
    [PurchaserTankID]           VARCHAR (20)     NULL,
    [WaterPurchaser]            INT              NULL,
    [SealOn]                    VARCHAR (20)     NULL,
    [SealOff]                   VARCHAR (20)     NULL,
    [SealDistributionCode]      INT              NULL,
    [BackSealOn]                VARCHAR (20)     NULL,
    [BackSealOff]               VARCHAR (20)     NULL,
    [BackSealDistributionCode]  INT              NULL,
    [BackSealDistribution]      VARCHAR (20)     NULL,
    [UnitsFlag]                 INT              NULL,
    [DeleteFlag]                INT              NULL,
    [BackgroundTaskFlag]        INT              NULL,
    [LastTransmission]          INT              NULL,
    [LastLoadDate]              DATETIME         NULL,
    [LastLoadTime]              CHAR (8)         NULL,
    [TransmitFlag]              INT              NULL,
    [SequenceNumber]            INT              NULL,
    [DateTimeStamp]             DATETIME         NULL,
    [BLogicDateStamp]           DATETIME         NULL,
    [BLogicTimeStamp]           CHAR (8)         NULL,
    [AllocationDateStamp]       DATETIME         NULL,
    [AllocationTimeStamp]       CHAR (8)         NULL,
    [UserDateStamp]             DATETIME         NULL,
    [UserTimeStamp]             CHAR (8)         NULL,
    [UserID]                    INT              NULL,
    [TrailerCapacity]           FLOAT (53)       NULL,
    [PercentFull]               FLOAT (53)       NULL,
    [TransferAsSoldFlag]        INT              NOT NULL,
    [PurchaserStatementID]      INT              NOT NULL,
    [HaulerStatementID]         INT              NOT NULL,
    [PurchaserStatementSeq]     INT              NULL,
    [HaulerStatementSeq]        INT              NULL,
    [CalculationStatusFlag]     INT              NOT NULL,
    [SourceLocationID]          INT              NULL,
    [DestinationLocationId]     INT              NULL,
    [QbyteTicketType]           INT              NULL,
    [SlopFlag]                  INT              NULL,
    [APIVersion]                INT              NOT NULL,
    [RowUID]                    UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_TankRunTicketTb] PRIMARY KEY CLUSTERED ([MerrickID] ASC, [RecordDate] ASC, [RunTicketNumber] ASC)
);
