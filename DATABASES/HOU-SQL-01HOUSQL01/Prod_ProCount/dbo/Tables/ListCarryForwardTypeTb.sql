CREATE TABLE [dbo].[ListCarryForwardTypeTb] (
    [Value]       INT          NOT NULL,
    [ObjectType]  INT          NULL,
    [Description] VARCHAR (80) NULL,
    [ActiveFlag]  INT          NULL,
    CONSTRAINT [PK_ListCarryForwardTypeTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

