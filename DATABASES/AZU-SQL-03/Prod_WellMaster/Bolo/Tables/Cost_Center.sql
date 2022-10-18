CREATE TABLE [Bolo].[Cost_Center] (
    [CC_UID]             VARCHAR (255) NULL,
    [Cost_Center]        VARCHAR (482) NULL,
    [Cost_Center_Number] VARCHAR (21)  NULL,
    [Cost_Center_Type]   VARCHAR (4)   NULL,
    [State]              VARCHAR (2)   NULL,
    [County]             VARCHAR (30)  NULL,
    [District]           VARCHAR (49)  NULL,
    [District_Number]    INT           NULL,
    [Area]               VARCHAR (33)  NULL,
    [Area_Number]        INT           NULL,
    [Field]              VARCHAR (34)  NULL,
    [Field_Number]       INT           NULL,
    [Prospect]           VARCHAR (68)  NULL,
    [Prospect_Number]    INT           NULL,
    [Operator]           VARCHAR (35)  NULL,
    [API_WELL_NO]        VARCHAR (18)  NULL,
    [LAST_STATUS]        VARCHAR (5)   NULL,
    [WellName]           VARCHAR (89)  NULL
);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [ccsi_Bolo_Cost_Center]
    ON [Bolo].[Cost_Center];

