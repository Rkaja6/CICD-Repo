CREATE TABLE [RiskMgmt].[System_Proc_Log] (
    [Logdate]        DATETIME2 (7) DEFAULT (sysdatetime()) NOT NULL,
    [ProcedureName]  VARCHAR (100) NULL,
    [ErrorLine]      INT           NULL,
    [ErrorMessage]   VARCHAR (MAX) NULL,
    [AdditionalInfo] VARCHAR (MAX) NULL
);

