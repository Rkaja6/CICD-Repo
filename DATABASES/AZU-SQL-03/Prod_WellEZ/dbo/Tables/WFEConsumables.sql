CREATE TABLE [dbo].[WFEConsumables] (
    [wfeconsumables_id] INT            IDENTITY (1, 1) NOT NULL,
    [well_id]           BIGINT         NULL,
    [report_Date]       DATETIME       NOT NULL,
    [job_number]        BIGINT         NOT NULL,
    [UserDefined_9]     NVARCHAR (MAX) NULL,
    [UserDefined_8]     NVARCHAR (MAX) NULL,
    [UserDefined_7]     NVARCHAR (MAX) NULL,
    [UserDefined_6]     NVARCHAR (MAX) NULL,
    [UserDefined_5]     NVARCHAR (MAX) NULL,
    [UserDefined_40]    NVARCHAR (MAX) NULL,
    [UserDefined_4]     NVARCHAR (MAX) NULL,
    [UserDefined_39]    NVARCHAR (MAX) NULL,
    [UserDefined_38]    NVARCHAR (MAX) NULL,
    [UserDefined_37]    NVARCHAR (MAX) NULL,
    [UserDefined_36]    NVARCHAR (MAX) NULL,
    [UserDefined_35]    NVARCHAR (MAX) NULL,
    [UserDefined_34]    NVARCHAR (MAX) NULL,
    [UserDefined_33]    NVARCHAR (MAX) NULL,
    [UserDefined_32]    NVARCHAR (MAX) NULL,
    [UserDefined_31]    NVARCHAR (MAX) NULL,
    [UserDefined_30]    NVARCHAR (MAX) NULL,
    [UserDefined_3]     NVARCHAR (MAX) NULL,
    [UserDefined_29]    NVARCHAR (MAX) NULL,
    [UserDefined_28]    NVARCHAR (MAX) NULL,
    [UserDefined_27]    NVARCHAR (MAX) NULL,
    [UserDefined_26]    NVARCHAR (MAX) NULL,
    [UserDefined_25]    NVARCHAR (MAX) NULL,
    [UserDefined_24]    NVARCHAR (MAX) NULL,
    [UserDefined_23]    NVARCHAR (MAX) NULL,
    [UserDefined_22]    NVARCHAR (MAX) NULL,
    [UserDefined_21]    NVARCHAR (MAX) NULL,
    [UserDefined_20]    NVARCHAR (MAX) NULL,
    [UserDefined_2]     NVARCHAR (MAX) NULL,
    [UserDefined_19]    NVARCHAR (MAX) NULL,
    [UserDefined_18]    NVARCHAR (MAX) NULL,
    [UserDefined_17]    NVARCHAR (MAX) NULL,
    [UserDefined_16]    NVARCHAR (MAX) NULL,
    [UserDefined_15]    NVARCHAR (MAX) NULL,
    [UserDefined_14]    NVARCHAR (MAX) NULL,
    [UserDefined_13]    NVARCHAR (MAX) NULL,
    [UserDefined_12]    NVARCHAR (MAX) NULL,
    [UserDefined_11]    NVARCHAR (MAX) NULL,
    [UserDefined_10]    NVARCHAR (MAX) NULL,
    [UserDefined_1]     NVARCHAR (MAX) NULL,
    [UomUserDefined_9]  INT            NULL,
    [UomUserDefined_8]  INT            NULL,
    [UomUserDefined_7]  INT            NULL,
    [UomUserDefined_6]  INT            NULL,
    [UomUserDefined_5]  INT            NULL,
    [UomUserDefined_4]  INT            NULL,
    [UomUserDefined_39] INT            NULL,
    [UomUserDefined_38] INT            NULL,
    [UomUserDefined_37] INT            NULL,
    [UomUserDefined_36] INT            NULL,
    [UomUserDefined_35] INT            NULL,
    [UomUserDefined_34] INT            NULL,
    [UomUserDefined_33] INT            NULL,
    [UomUserDefined_32] INT            NULL,
    [UomUserDefined_31] INT            NULL,
    [UomUserDefined_30] INT            NULL,
    [UomUserDefined_3]  INT            NULL,
    [UomUserDefined_29] INT            NULL,
    [UomUserDefined_28] INT            NULL,
    [UomUserDefined_27] INT            NULL,
    [UomUserDefined_26] INT            NULL,
    [UomUserDefined_25] INT            NULL,
    [UomUserDefined_24] INT            NULL,
    [UomUserDefined_23] INT            NULL,
    [UomUserDefined_22] INT            NULL,
    [UomUserDefined_21] INT            NULL,
    [UomUserDefined_20] INT            NULL,
    [UomUserDefined_2]  INT            NULL,
    [UomUserDefined_19] INT            NULL,
    [UomUserDefined_18] INT            NULL,
    [UomUserDefined_17] INT            NULL,
    [UomUserDefined_16] INT            NULL,
    [UomUserDefined_15] INT            NULL,
    [UomUserDefined_14] INT            NULL,
    [UomUserDefined_13] INT            NULL,
    [UomUserDefined_12] INT            NULL,
    [UomUserDefined_11] INT            NULL,
    [UomUserDefined_10] INT            NULL,
    [UomUserDefined_1]  INT            NULL,
    [PickList_9]        NVARCHAR (MAX) NULL,
    [PickList_8]        NVARCHAR (MAX) NULL,
    [PickList_7]        NVARCHAR (MAX) NULL,
    [PickList_6]        NVARCHAR (MAX) NULL,
    [PickList_5]        NVARCHAR (MAX) NULL,
    [PickList_4]        NVARCHAR (MAX) NULL,
    [PickList_3]        NVARCHAR (MAX) NULL,
    [PickList_2]        NVARCHAR (MAX) NULL,
    [PickList_10]       NVARCHAR (MAX) NULL,
    [PickList_1]        NVARCHAR (MAX) NULL,
    [CheckBox_1]        BIT            NULL,
    [CheckBox_2]        BIT            NULL,
    [CheckBox_3]        BIT            NULL,
    [CheckBox_4]        BIT            NULL,
    [CheckBox_5]        BIT            NULL,
    [CheckBox_6]        BIT            NULL,
    [CheckBox_7]        BIT            NULL,
    [CheckBox_8]        BIT            NULL,
    [CheckBox_9]        BIT            NULL,
    [CheckBox_10]       BIT            NULL,
    [UomPickList_1]     INT            NULL,
    [UomPickList_2]     INT            NULL,
    [UomPickList_3]     INT            NULL,
    [UomPickList_4]     INT            NULL,
    [UomPickList_5]     INT            NULL,
    [UomPickList_6]     INT            NULL,
    [UomPickList_7]     INT            NULL,
    [UomPickList_8]     INT            NULL,
    [UomPickList_9]     INT            NULL,
    [UomPickList_10]    INT            NULL,
    [reportTypeId]      BIGINT         NOT NULL,
    [Comment]           NVARCHAR (MAX) NULL,
    [RowID]             BIGINT         NOT NULL,
    [location_id]       INT            NULL,
    CONSTRAINT [PK_WFEConsumables] PRIMARY KEY CLUSTERED ([wfeconsumables_id] ASC)
);

