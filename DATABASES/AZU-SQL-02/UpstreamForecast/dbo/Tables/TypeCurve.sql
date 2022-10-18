CREATE TABLE [dbo].[TypeCurve] (
    [TypeCurveID]        INT              DEFAULT ((0)) NOT NULL,
    [IntervalNumber]     INT              NOT NULL,
    [IntervalDays]       INT              NULL,
    [Gas]                DECIMAL (14, 4)  NULL,
    [Oil]                DECIMAL (14, 4)  NULL,
    [Water]              DECIMAL (14, 4)  NULL,
    [MonthlyRate]        DECIMAL (38, 16) NULL,
    [DailyRate]          DECIMAL (38, 16) NULL,
    [BaseProductionDate] DATETIME         NULL,
    CONSTRAINT [PK_TypeCurve] PRIMARY KEY CLUSTERED ([TypeCurveID] ASC, [IntervalNumber] ASC)
);

