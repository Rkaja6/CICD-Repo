﻿CREATE TABLE [dbo].[Flowback] (
    [flowback_id]    INT             IDENTITY (1, 1) NOT NULL,
    [well_id]        BIGINT          NULL,
    [report_Date]    DATETIME        NOT NULL,
    [job_number]     BIGINT          NOT NULL,
    [Water_Total]    DECIMAL (19, 9) NULL,
    [Water_Remain]   DECIMAL (19, 9) NULL,
    [Water_Rec]      DECIMAL (19, 9) NULL,
    [UserDefined_9]  NVARCHAR (MAX)  NULL,
    [UserDefined_8]  NVARCHAR (MAX)  NULL,
    [UserDefined_7]  NVARCHAR (MAX)  NULL,
    [UserDefined_6]  NVARCHAR (MAX)  NULL,
    [UserDefined_5]  NVARCHAR (MAX)  NULL,
    [UserDefined_40] NVARCHAR (MAX)  NULL,
    [UserDefined_4]  NVARCHAR (MAX)  NULL,
    [UserDefined_39] NVARCHAR (MAX)  NULL,
    [UserDefined_38] NVARCHAR (MAX)  NULL,
    [UserDefined_37] NVARCHAR (MAX)  NULL,
    [UserDefined_36] NVARCHAR (MAX)  NULL,
    [UserDefined_35] NVARCHAR (MAX)  NULL,
    [UserDefined_34] NVARCHAR (MAX)  NULL,
    [UserDefined_33] NVARCHAR (MAX)  NULL,
    [UserDefined_32] NVARCHAR (MAX)  NULL,
    [UserDefined_31] NVARCHAR (MAX)  NULL,
    [UserDefined_30] NVARCHAR (MAX)  NULL,
    [UserDefined_3]  NVARCHAR (MAX)  NULL,
    [UserDefined_29] NVARCHAR (MAX)  NULL,
    [UserDefined_28] NVARCHAR (MAX)  NULL,
    [UserDefined_27] NVARCHAR (MAX)  NULL,
    [UserDefined_26] NVARCHAR (MAX)  NULL,
    [UserDefined_25] NVARCHAR (MAX)  NULL,
    [UserDefined_24] NVARCHAR (MAX)  NULL,
    [UserDefined_23] NVARCHAR (MAX)  NULL,
    [UserDefined_22] NVARCHAR (MAX)  NULL,
    [UserDefined_21] NVARCHAR (MAX)  NULL,
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
    [Tester]         NVARCHAR (MAX)  NULL,
    [SG]             DECIMAL (19, 9) NULL,
    [reportTypeId]   BIGINT          NOT NULL,
    [Remarks]        NVARCHAR (MAX)  NULL,
    [Phone2]         NVARCHAR (MAX)  NULL,
    [Phone1]         NVARCHAR (MAX)  NULL,
    [Oil]            DECIMAL (19, 9) NULL,
    [MtrRun]         DECIMAL (19, 9) NULL,
    [Helper]         NVARCHAR (MAX)  NULL,
    [Comments]       NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_Flowback] PRIMARY KEY CLUSTERED ([flowback_id] ASC)
);

