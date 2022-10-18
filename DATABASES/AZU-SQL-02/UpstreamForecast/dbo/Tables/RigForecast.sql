CREATE TABLE [dbo].[RigForecast] (
    [RigForecastID]    INT         NOT NULL,
    [RigID]            INT         NOT NULL,
    [RunTimeMonths]    INT         NULL,
    [RigCount]         INT         NULL,
    [TypeCurveID]      INT         NULL,
    [SpudIntervalDays] INT         NULL,
    [SpudLimit]        INT         NULL,
    [APIPrefix]        INT         NULL,
    [UnitForecastFlag] VARCHAR (1) NULL,
    [StartDate]        DATE        NULL,
    CONSTRAINT [PK_RigForecast] PRIMARY KEY CLUSTERED ([RigForecastID] ASC, [RigID] ASC)
);

