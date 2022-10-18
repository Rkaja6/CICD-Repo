CREATE TABLE [RPT].[Department_Head] (
    [Manager_Employee_ID] NVARCHAR (20) NOT NULL,
    [Manager_Legal_Name]  NVARCHAR (60) NULL,
    [Department_Name]     NVARCHAR (20) NULL,
    CONSTRAINT [PK_Department_Head] PRIMARY KEY CLUSTERED ([Manager_Employee_ID] ASC)
);

