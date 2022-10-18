CREATE TABLE [RPT].[Employee_Hours] (
    [Employee ID]            NVARCHAR (20)   NOT NULL,
    [Legal Name]             NVARCHAR (60)   NULL,
    [Period Start Date]      DATETIME        NOT NULL,
    [Period End Date]        DATETIME        NULL,
    [Worked Hours in Period] DECIMAL (18, 2) NULL,
    PRIMARY KEY CLUSTERED ([Employee ID] ASC, [Period Start Date] ASC)
);

