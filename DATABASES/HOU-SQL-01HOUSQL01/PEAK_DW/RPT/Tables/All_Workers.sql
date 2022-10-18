CREATE TABLE [RPT].[All_Workers] (
    [Employee ID]            NVARCHAR (20) NOT NULL,
    [Legal Name]             NVARCHAR (60) NULL,
    [Hire Date]              DATETIME      NULL,
    [Termination Date]       DATETIME      NULL,
    [Worker Status]          NVARCHAR (20) NULL,
    [Country]                NVARCHAR (50) NULL,
    [Worker Type]            NVARCHAR (20) NOT NULL,
    [Manager ID]             NVARCHAR (20) NULL,
    [Manager Name]           NVARCHAR (60) NULL,
    [Workday Location]       NVARCHAR (50) NULL,
    [Location]               NVARCHAR (20) NULL,
    [Department]             NVARCHAR (20) NULL,
    [Contingent Worker Type] NVARCHAR (50) NULL,
    [Time Type]              NVARCHAR (50) NULL,
    CONSTRAINT [PK_All_Workers] PRIMARY KEY CLUSTERED ([Employee ID] ASC, [Worker Type] ASC)
);

