﻿CREATE TABLE [dbo].[WFECasingRepeatable] (
    [wfecasingrepeatable_id]      INT             IDENTITY (1, 1) NOT NULL,
    [well_id]                     BIGINT          NOT NULL,
    [job_number]                  BIGINT          NOT NULL,
    [deleted]                     BIT             NOT NULL,
    [Override]                    NVARCHAR (MAX)  NOT NULL,
    [Weight]                      NVARCHAR (MAX)  NULL,
    [UomWeight]                   INT             NULL,
    [UomTopPipeTVD]               INT             NULL,
    [UomTopPipeMD]                INT             NULL,
    [UomShoeFromBottom]           INT             NULL,
    [UomRepeatableUserDefined_9]  INT             NULL,
    [UomRepeatableUserDefined_8]  INT             NULL,
    [UomRepeatableUserDefined_7]  INT             NULL,
    [UomRepeatableUserDefined_6]  INT             NULL,
    [UomRepeatableUserDefined_5]  INT             NULL,
    [UomRepeatableUserDefined_4]  INT             NULL,
    [UomRepeatableUserDefined_3]  INT             NULL,
    [UomRepeatableUserDefined_20] INT             NULL,
    [UomRepeatableUserDefined_2]  INT             NULL,
    [UomRepeatableUserDefined_19] INT             NULL,
    [UomRepeatableUserDefined_18] INT             NULL,
    [UomRepeatableUserDefined_17] INT             NULL,
    [UomRepeatableUserDefined_16] INT             NULL,
    [UomRepeatableUserDefined_15] INT             NULL,
    [UomRepeatableUserDefined_14] INT             NULL,
    [UomRepeatableUserDefined_13] INT             NULL,
    [UomRepeatableUserDefined_12] INT             NULL,
    [UomRepeatableUserDefined_11] INT             NULL,
    [UomRepeatableUserDefined_10] INT             NULL,
    [UomRepeatableUserDefined_1]  INT             NULL,
    [UomOD]                       INT             NULL,
    [UomMinTorque]                INT             NULL,
    [UomMaxTorque]                INT             NULL,
    [UomLength]                   INT             NULL,
    [UomID]                       INT             NULL,
    [UomCollapsePressure]         INT             NULL,
    [UomBurstPressure]            INT             NULL,
    [UomBottomTVD]                INT             NULL,
    [UomBottomMD]                 INT             NULL,
    [TopPipeTVD]                  FLOAT (53)      NULL,
    [TopPipeMD]                   FLOAT (53)      NULL,
    [ShoeFromBottom]              FLOAT (53)      NULL,
    [RepeatableUserDefined_9]     NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_8]     NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_7]     NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_6]     NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_5]     NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_4]     NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_3]     NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_20]    NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_2]     NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_19]    NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_18]    NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_17]    NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_16]    NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_15]    NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_14]    NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_13]    NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_12]    NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_11]    NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_10]    NVARCHAR (MAX)  NULL,
    [RepeatableUserDefined_1]     NVARCHAR (MAX)  NULL,
    [OD]                          NVARCHAR (MAX)  NULL,
    [NumberOfJoints]              NVARCHAR (MAX)  NULL,
    [MinTorque]                   FLOAT (53)      NULL,
    [MaxTorque]                   FLOAT (53)      NULL,
    [LineNumber]                  BIGINT          NOT NULL,
    [Length]                      DECIMAL (19, 9) NULL,
    [ItemDescription]             NVARCHAR (MAX)  NULL,
    [ID]                          DECIMAL (19, 9) NULL,
    [Grade]                       NVARCHAR (MAX)  NULL,
    [Connection]                  NVARCHAR (MAX)  NULL,
    [CollapsePressure]            FLOAT (53)      NULL,
    [CasingType]                  NVARCHAR (MAX)  NULL,
    [RowID]                       BIGINT          NOT NULL,
    [BurstPressure]               FLOAT (53)      NULL,
    [BottomTVD]                   FLOAT (53)      NULL,
    [BottomMD]                    FLOAT (53)      NULL,
    [reportTypeId]                BIGINT          NOT NULL,
    [CasingStringRef]             INT             NULL,
    [NumberCntrlz]                INT             NULL,
    [Component]                   NVARCHAR (MAX)  NULL,
    [TopOfCement]                 FLOAT (53)      NULL,
    [UomTopOfCement]              INT             NULL,
    [JointOut]                    BIT             NULL,
    CONSTRAINT [PK_WFECasingRepeatable] PRIMARY KEY CLUSTERED ([wfecasingrepeatable_id] ASC)
);

