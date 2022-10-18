﻿CREATE TABLE [dbo].[CompletionMonthlyDispTb] (
    [MerrickID]              INT          NOT NULL,
    [RecordDate]             DATETIME     NOT NULL,
    [SourceID]               INT          NOT NULL,
    [SourceType]             INT          NOT NULL,
    [RunTicketNumber]        VARCHAR (22) NOT NULL,
    [RunTicketDate]          DATETIME     NULL,
    [RunTicketFlag]          INT          NULL,
    [SequenceNumber]         INT          NULL,
    [ProductCode]            INT          NULL,
    [ProductType]            INT          NULL,
    [DispositionCode]        INT          NULL,
    [OverwriteFlag]          INT          NULL,
    [GatheringSystemID]      FLOAT (53)   NULL,
    [AllocActBTUFactor]      FLOAT (53)   NULL,
    [AllocActTemperature]    FLOAT (53)   NULL,
    [AllocActPressureBase]   FLOAT (53)   NULL,
    [AllocActGravity]        FLOAT (53)   NULL,
    [AllocActWetDryFlag]     INT          NULL,
    [AllocActOilVol]         FLOAT (53)   NULL,
    [AllocActWaterVol]       FLOAT (53)   NULL,
    [AllocActGasVolMCF]      FLOAT (53)   NULL,
    [AllocActGasVolMMBTU]    FLOAT (53)   NULL,
    [AllocActPlantGasMCF]    FLOAT (53)   NULL,
    [AllocActPlantGasMMBTU]  FLOAT (53)   NULL,
    [AllocActCO2Vol]         FLOAT (53)   NULL,
    [AllocActInjOilVol]      FLOAT (53)   NULL,
    [AllocActInjWaterVol]    FLOAT (53)   NULL,
    [AllocActInjGasVolMCF]   FLOAT (53)   NULL,
    [AllocActInjGasVolMMBTU] FLOAT (53)   NULL,
    [AllocActInjOtherVol]    FLOAT (53)   NULL,
    [AllocActInjCO2Vol]      FLOAT (53)   NULL,
    [AllocActOtherVol]       FLOAT (53)   NULL,
    [AllocActNGLVol]         FLOAT (53)   NULL,
    [AllocActSulfurMass]     FLOAT (53)   NULL,
    [DateTimeStamp]          DATETIME     NULL,
    [AllocationDateStamp]    DATETIME     NULL,
    [AllocationTimeStamp]    CHAR (8)     NULL,
    [UserDateStamp]          DATETIME     NULL,
    [UserTimeStamp]          CHAR (8)     NULL,
    [UserID]                 INT          NULL,
    [AllocActMass]           FLOAT (53)   NOT NULL,
    CONSTRAINT [PK_CompletionMonthlyDispTb] PRIMARY KEY CLUSTERED ([MerrickID] ASC, [RecordDate] ASC, [SourceID] ASC, [SourceType] ASC, [RunTicketNumber] ASC)
);

