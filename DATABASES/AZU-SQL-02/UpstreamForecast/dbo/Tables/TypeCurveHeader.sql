CREATE TABLE [dbo].[TypeCurveHeader] (
    [TypeCurveID]        INT           NOT NULL,
    [TypeCurveName]      VARCHAR (200) NULL,
    [CreationDate]       DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdateDate]         DATETIME2 (7) DEFAULT (getdate()) NULL,
    [TPCPlayName]        VARCHAR (500) NULL,
    [Commodity]          VARCHAR (50)  NULL,
    [BaseProductionDate] DATETIME      NULL,
    [SpudYear]           INT           NULL,
    CONSTRAINT [PK_TypeCurveHeader] PRIMARY KEY CLUSTERED ([TypeCurveID] ASC)
);

