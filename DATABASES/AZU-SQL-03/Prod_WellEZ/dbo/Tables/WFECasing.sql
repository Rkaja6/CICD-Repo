﻿CREATE TABLE [dbo].[WFECasing] (
    [wfecasing_id]            INT             IDENTITY (1, 1) NOT NULL,
    [well_id]                 BIGINT          NOT NULL,
    [job_number]              BIGINT          NOT NULL,
    [deleted]                 BIT             NOT NULL,
    [OverrideWeight]          INT             NOT NULL,
    [OverrideTVD]             INT             NOT NULL,
    [OverrideTMD]             INT             NOT NULL,
    [OverrideOD]              INT             NOT NULL,
    [OverrideLength]          INT             NOT NULL,
    [OverrideID]              INT             NOT NULL,
    [OverrideGrade]           INT             NOT NULL,
    [OverrideConnection]      INT             NOT NULL,
    [Weight]                  NVARCHAR (MAX)  NULL,
    [UserDefined_9]           NVARCHAR (MAX)  NULL,
    [UserDefined_8]           NVARCHAR (MAX)  NULL,
    [UserDefined_7]           NVARCHAR (MAX)  NULL,
    [UserDefined_6]           NVARCHAR (MAX)  NULL,
    [UserDefined_5]           NVARCHAR (MAX)  NULL,
    [UserDefined_40]          NVARCHAR (MAX)  NULL,
    [UserDefined_4]           NVARCHAR (MAX)  NULL,
    [UserDefined_39]          NVARCHAR (MAX)  NULL,
    [UserDefined_38]          NVARCHAR (MAX)  NULL,
    [UserDefined_37]          NVARCHAR (MAX)  NULL,
    [UserDefined_36]          NVARCHAR (MAX)  NULL,
    [UserDefined_35]          NVARCHAR (MAX)  NULL,
    [UserDefined_34]          NVARCHAR (MAX)  NULL,
    [UserDefined_33]          NVARCHAR (MAX)  NULL,
    [UserDefined_32]          NVARCHAR (MAX)  NULL,
    [UserDefined_31]          NVARCHAR (MAX)  NULL,
    [UserDefined_30]          NVARCHAR (MAX)  NULL,
    [UserDefined_3]           NVARCHAR (MAX)  NULL,
    [UserDefined_29]          NVARCHAR (MAX)  NULL,
    [UserDefined_28]          NVARCHAR (MAX)  NULL,
    [UserDefined_27]          NVARCHAR (MAX)  NULL,
    [UserDefined_26]          NVARCHAR (MAX)  NULL,
    [UserDefined_25]          NVARCHAR (MAX)  NULL,
    [UserDefined_24]          NVARCHAR (MAX)  NULL,
    [UserDefined_23]          NVARCHAR (MAX)  NULL,
    [UserDefined_22]          NVARCHAR (MAX)  NULL,
    [UserDefined_21]          NVARCHAR (MAX)  NULL,
    [UserDefined_20]          NVARCHAR (MAX)  NULL,
    [UserDefined_2]           NVARCHAR (MAX)  NULL,
    [UserDefined_19]          NVARCHAR (MAX)  NULL,
    [UserDefined_18]          NVARCHAR (MAX)  NULL,
    [UserDefined_17]          NVARCHAR (MAX)  NULL,
    [UserDefined_16]          NVARCHAR (MAX)  NULL,
    [UserDefined_15]          NVARCHAR (MAX)  NULL,
    [UserDefined_14]          NVARCHAR (MAX)  NULL,
    [UserDefined_13]          NVARCHAR (MAX)  NULL,
    [UserDefined_12]          NVARCHAR (MAX)  NULL,
    [UserDefined_11]          NVARCHAR (MAX)  NULL,
    [UserDefined_10]          NVARCHAR (MAX)  NULL,
    [UserDefined_1]           NVARCHAR (MAX)  NULL,
    [UomUserDefined_9]        INT             NULL,
    [UomUserDefined_8]        INT             NULL,
    [UomUserDefined_7]        INT             NULL,
    [UomUserDefined_6]        INT             NULL,
    [UomUserDefined_5]        INT             NULL,
    [UomUserDefined_4]        INT             NULL,
    [UomUserDefined_39]       INT             NULL,
    [UomUserDefined_38]       INT             NULL,
    [UomUserDefined_37]       INT             NULL,
    [UomUserDefined_36]       INT             NULL,
    [UomUserDefined_35]       INT             NULL,
    [UomUserDefined_34]       INT             NULL,
    [UomUserDefined_33]       INT             NULL,
    [UomUserDefined_32]       INT             NULL,
    [UomUserDefined_31]       INT             NULL,
    [UomUserDefined_30]       INT             NULL,
    [UomUserDefined_3]        INT             NULL,
    [UomUserDefined_29]       INT             NULL,
    [UomUserDefined_28]       INT             NULL,
    [UomUserDefined_27]       INT             NULL,
    [UomUserDefined_26]       INT             NULL,
    [UomUserDefined_25]       INT             NULL,
    [UomUserDefined_24]       INT             NULL,
    [UomUserDefined_23]       INT             NULL,
    [UomUserDefined_22]       INT             NULL,
    [UomUserDefined_21]       INT             NULL,
    [UomUserDefined_20]       INT             NULL,
    [UomUserDefined_2]        INT             NULL,
    [UomUserDefined_19]       INT             NULL,
    [UomUserDefined_18]       INT             NULL,
    [UomUserDefined_17]       INT             NULL,
    [UomUserDefined_16]       INT             NULL,
    [UomUserDefined_15]       INT             NULL,
    [UomUserDefined_14]       INT             NULL,
    [UomUserDefined_13]       INT             NULL,
    [UomUserDefined_12]       INT             NULL,
    [UomUserDefined_11]       INT             NULL,
    [UomUserDefined_10]       INT             NULL,
    [UomUserDefined_1]        INT             NULL,
    [UomTopOfCement]          INT             NULL,
    [UomStaticUserDefined_9]  INT             NULL,
    [UomStaticUserDefined_8]  INT             NULL,
    [UomStaticUserDefined_7]  INT             NULL,
    [UomStaticUserDefined_6]  INT             NULL,
    [UomStaticUserDefined_5]  INT             NULL,
    [UomStaticUserDefined_4]  INT             NULL,
    [UomStaticUserDefined_3]  INT             NULL,
    [UomStaticUserDefined_2]  INT             NULL,
    [UomStaticUserDefined_10] INT             NULL,
    [UomStaticUserDefined_1]  INT             NULL,
    [UomOD]                   INT             NULL,
    [UomLengthAboveRKB]       INT             NULL,
    [UomID]                   INT             NULL,
    [UomConductorHoleOD]      INT             NULL,
    [UomConductorHoleDepth]   INT             NULL,
    [UomCentralizerSpasing]   INT             NULL,
    [UomCasingWeigthMud]      INT             NULL,
    [UomCasingWeigthAir]      INT             NULL,
    [UomCasingHungWeight]     INT             NULL,
    [UomCasingHeadPresure]    INT             NULL,
    [TopOfLiner]              FLOAT (53)      NULL,
    [TopOfCement]             FLOAT (53)      NULL,
    [TimeCsgRun]              NVARCHAR (MAX)  NULL,
    [TimeCsgPulled]           NVARCHAR (MAX)  NULL,
    [TVD]                     DECIMAL (19, 9) NULL,
    [TMD]                     DECIMAL (19, 9) NULL,
    [TDLogger]                NVARCHAR (MAX)  NULL,
    [TDDriller]               NVARCHAR (MAX)  NULL,
    [StaticUserDefined_9]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_8]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_7]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_6]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_5]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_4]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_3]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_2]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_10]    NVARCHAR (MAX)  NULL,
    [StaticUserDefined_1]     NVARCHAR (MAX)  NULL,
    [StartTime]               NVARCHAR (MAX)  NULL,
    [StartDate]               DATETIME        NULL,
    [ShoeType]                NVARCHAR (MAX)  NULL,
    [Remarks]                 NVARCHAR (MAX)  NULL,
    [Recipocated]             NVARCHAR (MAX)  NULL,
    [PBTD]                    DECIMAL (19, 9) NULL,
    [OD]                      NVARCHAR (MAX)  NULL,
    [NoCentralizers]          INT             NULL,
    [LinerTopTVD]             FLOAT (53)      NULL,
    [LinerTopMD]              FLOAT (53)      NULL,
    [LinerSetTVD]             FLOAT (53)      NULL,
    [LinerSetMD]              FLOAT (53)      NULL,
    [LengthOfStroke]          FLOAT (53)      NULL,
    [LengthAboveRKB]          FLOAT (53)      NULL,
    [Length]                  DECIMAL (19, 9) NULL,
    [LandingType]             NVARCHAR (MAX)  NULL,
    [KB]                      FLOAT (53)      NULL,
    [ID]                      DECIMAL (19, 9) NULL,
    [Grade]                   NVARCHAR (MAX)  NULL,
    [FloatType]               NVARCHAR (MAX)  NULL,
    [FloatShoeDepth]          FLOAT (53)      NULL,
    [FloatHolding]            NVARCHAR (MAX)  NULL,
    [FloatColarDepth]         FLOAT (53)      NULL,
    [FinishTime]              NVARCHAR (MAX)  NULL,
    [FinishDate]              NVARCHAR (MAX)  NULL,
    [DateCsgRun]              NVARCHAR (MAX)  NULL,
    [DateCsgPulled]           NVARCHAR (MAX)  NULL,
    [Connection]              NVARCHAR (MAX)  NULL,
    [ConductorHoleOD]         DECIMAL (19, 9) NULL,
    [ConductorHoleDepth]      DECIMAL (19, 9) NULL,
    [Comments]                NVARCHAR (MAX)  NULL,
    [CentralizerSpasing]      FLOAT (53)      NULL,
    [CasingWeigthMud]         FLOAT (53)      NULL,
    [CasingWeigthAir]         FLOAT (53)      NULL,
    [CasingType]              NVARCHAR (MAX)  NULL,
    [RowID]                   BIGINT          NOT NULL,
    [CasingHungWeight]        FLOAT (53)      NULL,
    [CasingHeadPresure]       FLOAT (53)      NULL,
    [BitSize]                 FLOAT (53)      NULL,
    CONSTRAINT [PK_WFECasing] PRIMARY KEY CLUSTERED ([wfecasing_id] ASC)
);

