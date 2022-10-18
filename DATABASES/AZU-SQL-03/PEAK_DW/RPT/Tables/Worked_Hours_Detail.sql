CREATE TABLE [RPT].[Worked_Hours_Detail] (
    [EmployeeID]      NVARCHAR (20) NOT NULL,
    [Date]            DATETIME      NOT NULL,
    [Name]            NVARCHAR (60) NULL,
    [HireDate]        DATETIME      NULL,
    [TerminationDate] DATETIME      NULL,
    [WorkerStatus]    NVARCHAR (20) NULL,
    [Country]         NVARCHAR (50) NULL,
    [WorkerType]      NVARCHAR (20) NULL,
    [Location]        NVARCHAR (20) NULL,
    [Department]      NVARCHAR (20) NULL,
    [WorkedHours]     FLOAT (53)    NULL,
    [PeriodStartDate] DATETIME      NULL,
    [PeriodEndDate]   DATETIME      NULL,
    [Headcount]       INT           NULL,
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC, [Date] ASC)
);

