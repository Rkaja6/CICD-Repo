﻿CREATE TABLE [dbo].[MudInventoryMaterialRepeatable] (
    [mudinventorymaterialrepeatable_id] INT             IDENTITY (1, 1) NOT NULL,
    [well_id]                           BIGINT          NULL,
    [report_Date]                       DATETIME        NOT NULL,
    [line_number]                       BIGINT          NOT NULL,
    [job_number]                        BIGINT          NOT NULL,
    [UomPickList_5]                     INT             NULL,
    [UomPickList_4]                     INT             NULL,
    [UomPickList_3]                     INT             NULL,
    [UomPickList_2]                     INT             NULL,
    [UomPickList_1]                     INT             NULL,
    [QuantitySacks]                     INT             NULL,
    [Quantity]                          DECIMAL (19, 9) NULL,
    [PickList_5]                        NVARCHAR (MAX)  NULL,
    [PickList_4]                        NVARCHAR (MAX)  NULL,
    [PickList_3]                        NVARCHAR (MAX)  NULL,
    [PickList_2]                        NVARCHAR (MAX)  NULL,
    [PickList_1]                        NVARCHAR (MAX)  NULL,
    [Material]                          NVARCHAR (MAX)  NULL,
    [RowID]                             BIGINT          NOT NULL,
    [reportTypeId]                      BIGINT          NOT NULL,
    [UserDefined_1]                     NVARCHAR (MAX)  NULL,
    [UserDefined_2]                     NVARCHAR (MAX)  NULL,
    [UserDefined_3]                     NVARCHAR (MAX)  NULL,
    [UserDefined_4]                     NVARCHAR (MAX)  NULL,
    [UserDefined_5]                     NVARCHAR (MAX)  NULL,
    [UomUserDefined_1]                  INT             NULL,
    [UomUserDefined_2]                  INT             NULL,
    [UomUserDefined_3]                  INT             NULL,
    [UomUserDefined_4]                  INT             NULL,
    [UomUserDefined_5]                  INT             NULL,
    [location_id]                       INT             NULL,
    CONSTRAINT [PK_MudInventoryMaterialRepeatable] PRIMARY KEY CLUSTERED ([mudinventorymaterialrepeatable_id] ASC)
);

