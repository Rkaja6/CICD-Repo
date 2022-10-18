CREATE TABLE [RPT].[Stage_Employee_Hours] (
    [EE ID]                                  NVARCHAR (20)   NULL,
    [NAME]                                   NVARCHAR (60)   NULL,
    [Hire Date]                              DATETIME        NULL,
    [Termination Date]                       DATETIME        NULL,
    [YTD Hours]                              DECIMAL (18, 2) NULL,
    [Worker]                                 NVARCHAR (70)   NULL,
    [Earning Name]                           NVARCHAR (20)   NULL,
    [Pay Component Name]                     NVARCHAR (50)   NULL,
    [Period]                                 NVARCHAR (50)   NULL,
    [Hours (unprorated) Related Calculation] DECIMAL (18, 2) NULL
);

