CREATE TABLE [RPT].[Office_Location] (
    [Workday_Location]    NVARCHAR (50) NOT NULL,
    [Location_Short_Name] NVARCHAR (20) NULL,
    CONSTRAINT [PK_Office_Location] PRIMARY KEY CLUSTERED ([Workday_Location] ASC)
);

