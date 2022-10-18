CREATE TABLE [dbo].[ListMeterTypeTb] (
    [Value]              INT           NOT NULL,
    [Description]        VARCHAR (80)  NULL,
    [PumperInstructions] VARCHAR (200) NULL,
    [ProductCode]        INT           NULL,
    [ActiveFlag]         INT           NULL,
    CONSTRAINT [PK_ListMeterTypeTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

