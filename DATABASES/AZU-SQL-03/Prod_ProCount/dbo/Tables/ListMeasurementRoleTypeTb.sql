CREATE TABLE [dbo].[ListMeasurementRoleTypeTb] (
    [Value]       INT          NOT NULL,
    [ObjectType]  INT          NULL,
    [Description] VARCHAR (80) NULL,
    [ActiveFlag]  INT          NULL,
    CONSTRAINT [PK_ListMeasurementRoleTypeTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

