﻿CREATE TABLE [dbo].[PumpItems] (
    [pumpitems_id]   INT             IDENTITY (1, 1) NOT NULL,
    [well_id]        BIGINT          NOT NULL,
    [report_Date]    DATETIME        NOT NULL,
    [line_number]    BIGINT          NOT NULL,
    [job_number]     BIGINT          NOT NULL,
    [Volume]         DECIMAL (19, 9) NULL,
    [UserDefined_9]  NVARCHAR (MAX)  NULL,
    [UserDefined_8]  NVARCHAR (MAX)  NULL,
    [UserDefined_7]  NVARCHAR (MAX)  NULL,
    [UserDefined_6]  NVARCHAR (MAX)  NULL,
    [UserDefined_5]  NVARCHAR (MAX)  NULL,
    [UserDefined_4]  NVARCHAR (MAX)  NULL,
    [UserDefined_3]  NVARCHAR (MAX)  NULL,
    [UserDefined_20] NVARCHAR (MAX)  NULL,
    [UserDefined_2]  NVARCHAR (MAX)  NULL,
    [UserDefined_19] NVARCHAR (MAX)  NULL,
    [UserDefined_18] NVARCHAR (MAX)  NULL,
    [UserDefined_17] NVARCHAR (MAX)  NULL,
    [UserDefined_16] NVARCHAR (MAX)  NULL,
    [UserDefined_15] NVARCHAR (MAX)  NULL,
    [UserDefined_14] NVARCHAR (MAX)  NULL,
    [UserDefined_13] NVARCHAR (MAX)  NULL,
    [UserDefined_12] NVARCHAR (MAX)  NULL,
    [UserDefined_11] NVARCHAR (MAX)  NULL,
    [UserDefined_10] NVARCHAR (MAX)  NULL,
    [UserDefined_1]  NVARCHAR (MAX)  NULL,
    [Type]           NVARCHAR (MAX)  NULL,
    [StrokeLength]   DECIMAL (19, 9) NULL,
    [SPM]            BIGINT          NULL,
    [SN]             NVARCHAR (MAX)  NULL,
    [reportTypeId]   BIGINT          NOT NULL,
    [Rating]         DECIMAL (19, 9) NULL,
    [Pressure]       DECIMAL (19, 9) NULL,
    [Number]         BIGINT          NULL,
    [Model]          NVARCHAR (MAX)  NULL,
    [Make]           NVARCHAR (MAX)  NULL,
    [LinerSize]      DECIMAL (19, 9) NULL,
    [Jet_Velocity]   DECIMAL (19, 9) NULL,
    [HSI]            DECIMAL (19, 9) NULL,
    [HHP]            DECIMAL (19, 9) NULL,
    [Efficiency]     REAL            NULL,
    [AVDP]           DECIMAL (19, 9) NULL,
    [AVDC]           DECIMAL (19, 9) NULL,
    [ECD_TD]         DECIMAL (19, 9) NULL,
    [ECD_SH]         DECIMAL (19, 9) NULL,
    CONSTRAINT [PK_PumpItems] PRIMARY KEY CLUSTERED ([pumpitems_id] ASC)
);

