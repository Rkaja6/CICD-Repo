﻿CREATE TABLE [dbo].[WFEBha] (
    [wfebha_id]               INT             IDENTITY (1, 1) NOT NULL,
    [well_id]                 BIGINT          NOT NULL,
    [job_number]              BIGINT          NOT NULL,
    [deleted]                 BIT             NOT NULL,
    [WeightInMud]             FLOAT (53)      NULL,
    [WeightInAir]             FLOAT (53)      NULL,
    [WeightBelowJars]         FLOAT (53)      NULL,
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
    [UomWeightInMud]          INT             NULL,
    [UomWeightInAir]          INT             NULL,
    [UomWeightBelowJars]      INT             NULL,
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
    [UomTorque]               INT             NULL,
    [UomStringWeightUp]       INT             NULL,
    [UomStringWeightRotating] INT             NULL,
    [UomStringWeightDown]     INT             NULL,
    [UomStaticUserDefined_9]  INT             NULL,
    [UomStaticUserDefined_8]  INT             NULL,
    [UomStaticUserDefined_7]  INT             NULL,
    [UomStaticUserDefined_6]  INT             NULL,
    [UomStaticUserDefined_5]  INT             NULL,
    [UomStaticUserDefined_4]  INT             NULL,
    [UomStaticUserDefined_3]  INT             NULL,
    [UomStaticUserDefined_20] INT             NULL,
    [UomStaticUserDefined_2]  INT             NULL,
    [UomStaticUserDefined_19] INT             NULL,
    [UomStaticUserDefined_18] INT             NULL,
    [UomStaticUserDefined_17] INT             NULL,
    [UomStaticUserDefined_16] INT             NULL,
    [UomStaticUserDefined_15] INT             NULL,
    [UomStaticUserDefined_14] INT             NULL,
    [UomStaticUserDefined_13] INT             NULL,
    [UomStaticUserDefined_12] INT             NULL,
    [UomStaticUserDefined_11] INT             NULL,
    [UomStaticUserDefined_10] INT             NULL,
    [UomStaticUserDefined_1]  INT             NULL,
    [UomMaxPullAllowed]       INT             NULL,
    [UomLength]               INT             NULL,
    [UomDrillPipeOD]          INT             NULL,
    [Torque]                  FLOAT (53)      NULL,
    [TimeRun]                 NVARCHAR (MAX)  NULL,
    [TimePulled]              NVARCHAR (MAX)  NULL,
    [StringWeightUp]          FLOAT (53)      NULL,
    [StringWeightRotating]    FLOAT (53)      NULL,
    [StringWeightDown]        FLOAT (53)      NULL,
    [StaticUserDefined_9]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_8]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_7]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_6]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_5]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_4]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_3]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_20]    NVARCHAR (MAX)  NULL,
    [StaticUserDefined_2]     NVARCHAR (MAX)  NULL,
    [StaticUserDefined_19]    NVARCHAR (MAX)  NULL,
    [StaticUserDefined_18]    NVARCHAR (MAX)  NULL,
    [StaticUserDefined_17]    NVARCHAR (MAX)  NULL,
    [StaticUserDefined_16]    NVARCHAR (MAX)  NULL,
    [StaticUserDefined_15]    NVARCHAR (MAX)  NULL,
    [StaticUserDefined_14]    NVARCHAR (MAX)  NULL,
    [StaticUserDefined_13]    NVARCHAR (MAX)  NULL,
    [StaticUserDefined_12]    NVARCHAR (MAX)  NULL,
    [StaticUserDefined_11]    NVARCHAR (MAX)  NULL,
    [StaticUserDefined_10]    NVARCHAR (MAX)  NULL,
    [StaticUserDefined_1]     NVARCHAR (MAX)  NULL,
    [ShortName]               NVARCHAR (MAX)  NULL,
    [PickList_9]              NVARCHAR (MAX)  NULL,
    [PickList_8]              NVARCHAR (MAX)  NULL,
    [PickList_7]              NVARCHAR (MAX)  NULL,
    [PickList_6]              NVARCHAR (MAX)  NULL,
    [PickList_5]              NVARCHAR (MAX)  NULL,
    [PickList_4]              NVARCHAR (MAX)  NULL,
    [PickList_3]              NVARCHAR (MAX)  NULL,
    [PickList_2]              NVARCHAR (MAX)  NULL,
    [PickList_10]             NVARCHAR (MAX)  NULL,
    [PickList_1]              NVARCHAR (MAX)  NULL,
    [Name]                    NVARCHAR (MAX)  NULL,
    [MaxPullAllowed]          FLOAT (53)      NULL,
    [Length]                  DECIMAL (19, 9) NULL,
    [JarsHrsIn]               FLOAT (53)      NULL,
    [HrsIn]                   FLOAT (53)      NULL,
    [DrillPipeOD]             DECIMAL (19, 9) NULL,
    [Description]             NVARCHAR (MAX)  NULL,
    [DateRun]                 NVARCHAR (MAX)  NULL,
    [DatePulled]              NVARCHAR (MAX)  NULL,
    [Comments]                NVARCHAR (MAX)  NULL,
    [BHANo]                   NVARCHAR (MAX)  NULL,
    [RowID]                   BIGINT          NOT NULL,
    [reportTypeId]            BIGINT          NOT NULL,
    [BHAStringRef]            INT             NULL,
    CONSTRAINT [PK_WFEBha] PRIMARY KEY CLUSTERED ([wfebha_id] ASC)
);
