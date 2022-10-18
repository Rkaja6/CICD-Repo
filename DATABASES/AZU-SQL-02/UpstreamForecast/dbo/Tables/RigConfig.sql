CREATE TABLE [dbo].[RigConfig] (
    [RigID]         VARCHAR (40)  NOT NULL,
    [API10]         VARCHAR (10)  NOT NULL,
    [Basin]         VARCHAR (30)  NULL,
    [Operator]      VARCHAR (225) NULL,
    [Area]          VARCHAR (255) NULL,
    [FirstSpudDate] DATETIME2 (7) NOT NULL,
    [SpudInterval]  INT           NULL,
    [SpudLimit]     INT           NULL,
    [TypeCurveID]   INT           NULL,
    CONSTRAINT [PK_RigConfig] PRIMARY KEY CLUSTERED ([RigID] ASC, [API10] ASC)
);

