﻿CREATE TABLE [dbo].[Solids] (
    [solids_id]      INT             IDENTITY (1, 1) NOT NULL,
    [well_id]        BIGINT          NOT NULL,
    [report_Date]    DATETIME        NOT NULL,
    [job_number]     BIGINT          NOT NULL,
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
    [Shaker]         NVARCHAR (MAX)  NULL,
    [ScreenSize]     DECIMAL (19, 9) NULL,
    [reportTypeId]   BIGINT          NOT NULL,
    [Other]          NVARCHAR (MAX)  NULL,
    [Desilter]       DECIMAL (19, 9) NULL,
    [Desander]       DECIMAL (19, 9) NULL,
    [Degasser]       NVARCHAR (MAX)  NULL,
    [Comment]        NVARCHAR (MAX)  NULL,
    [Centrifuge]     DECIMAL (19, 9) NULL,
    CONSTRAINT [PK_Solids] PRIMARY KEY CLUSTERED ([solids_id] ASC)
);

