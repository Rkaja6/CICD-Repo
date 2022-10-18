﻿CREATE TABLE [dbo].[UserDefined_3] (
    [userdefined_3_id] INT            IDENTITY (1, 1) NOT NULL,
    [well_id]          BIGINT         NULL,
    [report_Date]      DATETIME       NOT NULL,
    [job_number]       BIGINT         NOT NULL,
    [UserDefined_9]    NVARCHAR (MAX) NULL,
    [UserDefined_8]    NVARCHAR (MAX) NULL,
    [UserDefined_7]    NVARCHAR (MAX) NULL,
    [UserDefined_6]    NVARCHAR (MAX) NULL,
    [UserDefined_5]    NVARCHAR (MAX) NULL,
    [UserDefined_40]   NVARCHAR (MAX) NULL,
    [UserDefined_4]    NVARCHAR (MAX) NULL,
    [UserDefined_39]   NVARCHAR (MAX) NULL,
    [UserDefined_38]   NVARCHAR (MAX) NULL,
    [UserDefined_37]   NVARCHAR (MAX) NULL,
    [UserDefined_36]   NVARCHAR (MAX) NULL,
    [UserDefined_35]   NVARCHAR (MAX) NULL,
    [UserDefined_34]   NVARCHAR (MAX) NULL,
    [UserDefined_33]   NVARCHAR (MAX) NULL,
    [UserDefined_32]   NVARCHAR (MAX) NULL,
    [UserDefined_31]   NVARCHAR (MAX) NULL,
    [UserDefined_30]   NVARCHAR (MAX) NULL,
    [UserDefined_3]    NVARCHAR (MAX) NULL,
    [UserDefined_29]   NVARCHAR (MAX) NULL,
    [UserDefined_28]   NVARCHAR (MAX) NULL,
    [UserDefined_27]   NVARCHAR (MAX) NULL,
    [UserDefined_26]   NVARCHAR (MAX) NULL,
    [UserDefined_25]   NVARCHAR (MAX) NULL,
    [UserDefined_24]   NVARCHAR (MAX) NULL,
    [UserDefined_23]   NVARCHAR (MAX) NULL,
    [UserDefined_22]   NVARCHAR (MAX) NULL,
    [UserDefined_21]   NVARCHAR (MAX) NULL,
    [UserDefined_20]   NVARCHAR (MAX) NULL,
    [UserDefined_2]    NVARCHAR (MAX) NULL,
    [UserDefined_19]   NVARCHAR (MAX) NULL,
    [UserDefined_18]   NVARCHAR (MAX) NULL,
    [UserDefined_17]   NVARCHAR (MAX) NULL,
    [UserDefined_16]   NVARCHAR (MAX) NULL,
    [UserDefined_15]   NVARCHAR (MAX) NULL,
    [UserDefined_14]   NVARCHAR (MAX) NULL,
    [UserDefined_13]   NVARCHAR (MAX) NULL,
    [UserDefined_12]   NVARCHAR (MAX) NULL,
    [UserDefined_11]   NVARCHAR (MAX) NULL,
    [UserDefined_10]   NVARCHAR (MAX) NULL,
    [UserDefined_1]    NVARCHAR (MAX) NULL,
    [reportTypeId]     BIGINT         NOT NULL,
    [PickList_5]       NVARCHAR (MAX) NULL,
    [PickList_4]       NVARCHAR (MAX) NULL,
    [PickList_3]       NVARCHAR (MAX) NULL,
    [PickList_2]       NVARCHAR (MAX) NULL,
    [PickList_1]       NVARCHAR (MAX) NULL,
    [Comment]          NVARCHAR (MAX) NULL,
    [UomPickList_1]    INT            NULL,
    [UomPickList_2]    INT            NULL,
    [UomPickList_3]    INT            NULL,
    [UomPickList_4]    INT            NULL,
    [UomPickList_5]    INT            NULL,
    [UomPickList_6]    INT            NULL,
    [UomPickList_7]    INT            NULL,
    [UomPickList_8]    INT            NULL,
    [UomPickList_9]    INT            NULL,
    [UomPickList_10]   INT            NULL,
    [CheckBox_1]       BIT            NULL,
    [CheckBox_2]       BIT            NULL,
    [CheckBox_3]       BIT            NULL,
    [CheckBox_4]       BIT            NULL,
    [CheckBox_5]       BIT            NULL,
    [CheckBox_6]       BIT            NULL,
    [CheckBox_7]       BIT            NULL,
    [CheckBox_8]       BIT            NULL,
    [CheckBox_9]       BIT            NULL,
    [CheckBox_10]      BIT            NULL,
    [RowID]            BIGINT         NOT NULL,
    [location_id]      INT            NULL,
    CONSTRAINT [PK_UserDefined_3] PRIMARY KEY CLUSTERED ([userdefined_3_id] ASC)
);

