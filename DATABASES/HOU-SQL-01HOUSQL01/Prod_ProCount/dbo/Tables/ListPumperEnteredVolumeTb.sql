CREATE TABLE [dbo].[ListPumperEnteredVolumeTb] (
    [Value]       INT           NOT NULL,
    [Description] VARCHAR (200) NULL,
    [ActiveFlag]  INT           NULL,
    CONSTRAINT [PK_ListPumperEnteredVolumeTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

