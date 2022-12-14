CREATE TABLE [dbo].[Cementing] (
    [cementing_id]   INT             IDENTITY (1, 1) NOT NULL,
    [well_id]        BIGINT          NOT NULL,
    [report_Date]    DATETIME        NOT NULL,
    [job_number]     BIGINT          NOT NULL,
    [Weight]         NVARCHAR (MAX)  NULL,
    [Volume]         DECIMAL (19, 9) NULL,
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
    [Type]           NVARCHAR (MAX)  NULL,
    [TM]             NVARCHAR (MAX)  NULL,
    [reportTypeId]   BIGINT          NOT NULL,
    [PRM]            DECIMAL (19, 9) NULL,
    [PRD]            DECIMAL (19, 9) NULL,
    [MR]             DECIMAL (19, 9) NULL,
    [FCP]            DECIMAL (19, 9) NULL,
    [Engineer]       NVARCHAR (MAX)  NULL,
    [ECT]            DECIMAL (19, 9) NULL,
    [District]       NVARCHAR (MAX)  NULL,
    [DF]             NVARCHAR (MAX)  NULL,
    [Company]        NVARCHAR (MAX)  NULL,
    [Comment]        NVARCHAR (MAX)  NULL,
    [CasingSheet]    NVARCHAR (MAX)  NULL,
    [CR]             DECIMAL (19, 9) NULL,
    [CE]             DECIMAL (19, 9) NULL,
    [CD]             DECIMAL (19, 9) NULL,
    [BP]             DECIMAL (19, 9) NULL,
    [BE]             NVARCHAR (MAX)  NULL,
    [AD]             DECIMAL (19, 9) NULL,
    CONSTRAINT [PK_Cementing] PRIMARY KEY CLUSTERED ([cementing_id] ASC)
);

